import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

import '../controllers/news_controller.dart';

final newsMock = News(
  image: imageUrl,
  overline: "overline",
  title: "title",
  subtitle: "subtitle",
  body: "body",
  id: "id",
  creation: Timestamp(1000000, 1000000),
);
