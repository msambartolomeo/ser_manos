import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringDataImplementation implements VolunteeringData {
  final FirebaseFirestore firebaseFirestore;

  final StreamController<Map<String, int>> _vacantsStreamController =
      StreamController<Map<String, int>>.broadcast();

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

  // @override
  // void listenToSpecificVacantChanges(String id) {
  //   final collection = firebaseFirestore.collection("volunteering");

  //   collection.doc(id).snapshots().listen(
  //     (DocumentSnapshot<Map<String, dynamic>> event) async {
  //       // final data = await _vacantsStreamController.stream.last;

  //       final fieldValue = event.get("vacants");
  //       if (fieldValue != null) {
  //         // data[id] = fieldValue;
  //         // _vacantsStreamController.add(data);
  //       }
  //     },
  //     onError: (error) {
  //       throw Exception("Error fetching data: $error");
  //     },
  //   );
  // }

  @override
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

        _vacantsStreamController.add(data);
      },
      onError: (error) {
        throw Exception("Error fetching data: $error");
      },
    );
  }

  @override
  Stream<Map<String, int>> getVacantStream() {
    return _vacantsStreamController.stream;
  }

  @override
  Future<void> decreaseVacants(String uid) async {
    final volunteeringRef =
        firebaseFirestore.collection("volunteering").doc(uid);

    final volunteering = await volunteeringRef.get();

    if (volunteering.exists) {
      final int vacants = volunteering.data()!["vacants"];

      if (vacants == 0) {
        throw Exception("No more vacants left!");
      }

      volunteeringRef.update({"vacants": vacants - 1});
    }
  }

  @override
  Future<void> increaseVacants(String uid) async {
    final volunteeringRef =
        firebaseFirestore.collection("volunteering").doc(uid);

    final volunteering = await volunteeringRef.get();

    if (volunteering.exists) {
      final int vacants = volunteering.data()!["vacants"];

      volunteeringRef.update({"vacants": vacants + 1});
    }
  }
}
