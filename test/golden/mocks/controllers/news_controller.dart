import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

Future<List<News>> newsGetAllEmptyControllerMock(ref) async {
  return List.empty();
}

const imageUrl = 'https://your.image.uri.here';
Future<List<News>> newsGetAllControllerMock(ref) async {
  return List.filled(
      3,
      News(
        image: imageUrl,
        overline: "overline",
        title: "title",
        subtitle: "subtitle",
        body: "body",
        id: "id",
        creation: Timestamp(1672531199, 999000000),
      ));
}
