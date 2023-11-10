import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  VolunteeringData({required this.firebaseFirestore});

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

  Future<Volunteering> get(String id) async {
    final collection = firebaseFirestore.collection("volunteering");
    final documentSnapshot = await collection.doc(id).get();

    if (!documentSnapshot.exists) {
      throw Exception("Volunteering ID does not exists.");
    }

    return Volunteering.fromJson(documentSnapshot.data()!);
  }
}
