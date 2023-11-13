import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/data/volunteering_data_impl.dart';
import 'package:ser_manos/models/models.dart';

void main() {
  final Timestamp timestamp = Timestamp.now();

  const String collectionId = "volunteering";

  final Volunteering volunteering1 = Volunteering(
    id: "id1",
    image: "image1",
    name: "name1",
    purpose: "purpose1",
    description: "description1",
    requirements: ["requirement1"],
    disponibility: ["disponibility1"],
    vacants: 3,
    address: "address1",
    geolocation: const GeoPoint(0.0, 0.0),
    creation: timestamp,
  );

  final Volunteering volunteering2 = Volunteering(
    id: "id2",
    image: "image2",
    name: "name2",
    purpose: "purpose2",
    description: "description2",
    requirements: ["requirement2"],
    disponibility: ["disponibility2"],
    vacants: 2,
    address: "address2",
    geolocation: const GeoPoint(1.0, 1.0),
    creation: timestamp,
  );

  late VolunteeringData volunteeringData;
  late FirebaseFirestore firestore;

  group("Volunteering Data Testing", () {
    setUp(() async {
      // Poblar la base de datos falsa.
      firestore = FakeFirebaseFirestore();
      await firestore
          .collection(collectionId)
          .doc(volunteering1.id)
          .set(volunteering1.toJson());
      await firestore
          .collection(collectionId)
          .doc(volunteering2.id)
          .set(volunteering2.toJson());
      volunteeringData =
          VolunteeringDataImplementation(firebaseFirestore: firestore);
    });

    test("Recuperar voluntariados", () async {
      expect(await volunteeringData.get(volunteering1.id), volunteering1);
      expect(await volunteeringData.get(volunteering2.id), volunteering2);
    });

    test("Voluntariado no existe", () async {
      expect(() async {
        await volunteeringData.get("???");
      }, throwsException);
    });

    test("Obtener todos los voluntariados", () async {
      List<Volunteering> list = await volunteeringData.getAll(null);

      expect(list.contains(volunteering1), true);
      expect(list.contains(volunteering2), true);
      expect(list.length, 2);
    });

    test("Obtener todos los voluntariados con búsqueda", () async {
      List<Volunteering> list = await volunteeringData.getAll("name1");

      expect(list.contains(volunteering1), true);
      expect(list.contains(volunteering2), false);
      expect(list.length, 1);
    });

    test("Obtener todos los voluntariados vacío", () async {
      await firestore.collection(collectionId).doc(volunteering1.id).delete();
      await firestore.collection(collectionId).doc(volunteering2.id).delete();

      List<Volunteering> list = await volunteeringData.getAll(null);

      expect(list.length, 0);
    });

    test("Disminuir vacantes", () async {
      await volunteeringData.decreaseVacants("id1");
      expect(
          (await firestore
              .collection(collectionId)
              .doc("id1")
              .get())["vacants"],
          2);
      expect(
          (await firestore
              .collection(collectionId)
              .doc("id2")
              .get())["vacants"],
          2);
    });

    test("Aumentar vacantes", () async {
      await volunteeringData.increaseVacants("id2");
      expect(
          (await firestore
              .collection(collectionId)
              .doc("id1")
              .get())["vacants"],
          3);
      expect(
          (await firestore
              .collection(collectionId)
              .doc("id2")
              .get())["vacants"],
          3);
    });
  });
}
