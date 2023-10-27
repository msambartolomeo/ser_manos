import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  VolunteeringData({required this.firebaseFirestore});

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

  Future<Volunteering> get(String id) async {
    final collection = firebaseFirestore.collection("volunteering");
    final documentSnapshot = await collection.doc(id).get();

    if (!documentSnapshot.exists) {
      throw Exception("Volunteering ID does not exists.");
    }

    return Volunteering.fromJson(documentSnapshot.data()!);
  }
}
