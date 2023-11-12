import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDataImplementation implements VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  VolunteeringDataImplementation({required this.firebaseFirestore});

  @override
  Future<Map<String, Volunteering>> getAll() async {
    final collection = firebaseFirestore.collection("volunteering");
    final querySnapshot = await collection.get();

    return querySnapshot.docs.fold<Map<String, Volunteering>>(
      {},
      (map, doc) {
        map[doc.id] = Volunteering.fromJson(
            doc.data()); // Usamos el ID del documento como clave
        return map;
      },
    );
  }

  @override
  Future<Volunteering> get(String id) async {
    final collection = firebaseFirestore.collection("volunteering");
    final documentSnapshot = await collection.doc(id).get();

    if (!documentSnapshot.exists) {
      throw Exception("Volunteering ID does not exists.");
    }

    return Volunteering.fromJson(documentSnapshot.data()!);
  }
}
