import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDataImplementation implements VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  VolunteeringDataImplementation({required this.firebaseFirestore});

  @override
  Future<List<Volunteering>> getAll() async {
    final collection = firebaseFirestore.collection("volunteering");
    final querySnapshot = await collection.get();

    return querySnapshot.docs.fold<List<Volunteering>>(
      [],
      (List<Volunteering> list, doc) {
        final data = doc.data();
        data["id"] = doc.id;

        list.add(Volunteering.fromJson(data));

        return list;
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

    final json = documentSnapshot.data();
    json!["id"] = id;

    return Volunteering.fromJson(json);
  }
}
