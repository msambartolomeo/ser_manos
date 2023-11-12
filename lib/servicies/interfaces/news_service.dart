import 'package:ser_manos/models/models.dart';

abstract class NewsService {
  Future<List<News>> getAll();

  Future<News> getById(String id);
}
