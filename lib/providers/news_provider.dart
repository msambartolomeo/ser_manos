import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part "generated/news_provider.g.dart";

@riverpod
Future<Map<String, News>> fetchNews(FetchNewsRef ref) async {
  final firestore = ref.read(firebaseFirestoreProvider);
  final collection = firestore.collection("news");
  final querySnapshot = await collection.get();
  
  Map<String, News> newsMap = querySnapshot.docs.fold<Map<String, News>>({}, (map, doc) {
  final data = doc.data();
  final news = News(
    title: data['title'],
    subtitle: data['subtitle'],
    image: data['image'],
    body: data['body'],
    overline: data['overline']
  );
  map[doc.id] = news; // Usamos el ID del documento como clave
  return map;
});

  return newsMap;
}