import 'package:ser_manos/data/interfaces/news_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/interfaces/news_service.dart';

class NewsServiceImplementation implements NewsService {
  final NewsData newsData;

  NewsServiceImplementation({required this.newsData});

  @override
  Future<List<News>> getAll() async {
    final news = await newsData.getAll();

    news.sort();

    return news;
  }

  @override
  Future<News> getById(String id) async {
    return await newsData.getById(id);
  }
}
