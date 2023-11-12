import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/data/interfaces/news_data.dart';

class NewsDataImplementation implements NewsData {
  final FirebaseFirestore firebaseFirestore;

  NewsDataImplementation({required this.firebaseFirestore});

  @override
  Future<List<News>> getAll() async {
    final collection = firebaseFirestore.collection("news");
    final querySnapshot = await collection.get();

    return querySnapshot.docs.fold<List<News>>(
      [],
      (List<News> list, doc) {
        final data = doc.data();
        data["id"] = doc.id;

        list.add(News.fromJson(data));

        return list;
      },
    );
  }

  @override
  Future<News> getById(String id) async {
    final collection = firebaseFirestore.collection("news");
    final documentSnapshot = await collection.doc(id).get();

    if (!documentSnapshot.exists) {
      throw Exception("News ID does not exists.");
    }

    final json = documentSnapshot.data();
    json!["id"] = id;

    return News.fromJson(json);
  }
}
