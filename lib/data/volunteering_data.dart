import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  StreamController<Map<String, int>> _controller =
  StreamController<Map<String, int>>();

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


  void listenToVacantChanges() {
    final collection = firebaseFirestore.collection("volunteering");

    collection.snapshots().listen(
          (QuerySnapshot<Map<String, dynamic>> event) {
        final data = event.docs.fold<Map<String, int>>(
          {},
              (map, doc) {
            final fieldValue = doc.get("vacants");
            if (fieldValue != null) {
              map[doc.id] = fieldValue;
            }
            return map;
          },
        );

        _controller.add(data);
      },
      onError: (error) {
        // Handle errors appropriately
        print("Error fetching data: $error");
      },
    );
  }

  void dispose() {
    _controller.close();
  }

  Stream<Map<String, int>> getVacantStream() {
    return _controller.stream;
  }


}
