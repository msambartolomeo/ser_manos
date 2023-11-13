import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/interfaces/news_data.dart';
import 'package:ser_manos/data/news_data_impl.dart';
import 'package:ser_manos/models/models.dart';

void main() {
  final Timestamp timestamp = Timestamp.now();

  const String collectionId = "news";

  final News news1 = News(
    image: "image1",
    overline: "overline1",
    title: "title1",
    subtitle: "subtitle1",
    body: "body1",
    id: "id1",
    creation: timestamp,
  );

  final News news2 = News(
    image: "image2",
    overline: "overline2",
    title: "title2",
    subtitle: "subtitle2",
    body: "body2",
    id: "id2",
    creation: timestamp,
  );

  late NewsData newsData;
  late FirebaseFirestore firestore;

  group("News Data Testing", () {
    setUp(() async {
      // Populate the fake database.
      firestore = FakeFirebaseFirestore();
      await firestore
          .collection(collectionId)
          .doc(news1.id)
          .set(news1.toJson());
      await firestore
          .collection(collectionId)
          .doc(news2.id)
          .set(news2.toJson());
      newsData = NewsDataImplementation(firebaseFirestore: firestore);
    });

    test("Retrieve news", () async {
      expect(await newsData.getById(news1.id), news1);
      expect(await newsData.getById(news2.id), news2);
    });

    test("News not exists", () async {
      expect(() async {
        await newsData.getById("???");
      }, throwsException);
    });

    test("Get all news", () async {
      List<News> list = await newsData.getAll();

      expect(list.contains(news1), true);
      expect(list.contains(news2), true);
      expect(list.length, 2);
    });

    test("Get all news empty", () async {
      await firestore.collection(collectionId).doc(news1.id).delete();
      await firestore.collection(collectionId).doc(news2.id).delete();

      List<News> list = await newsData.getAll();

      expect(list.length, 0);
    });
  });
}
