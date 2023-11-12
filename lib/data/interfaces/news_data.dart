import 'package:ser_manos/models/models.dart';

abstract class NewsData {
  Future<List<News>> getAll();

  Future<News> getById(String id);
}
