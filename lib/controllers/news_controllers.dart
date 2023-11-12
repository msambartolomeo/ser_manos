import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/news_controllers.g.dart';

@riverpod
Future<List<News>> newsGetAllController(NewsGetAllControllerRef ref) async {
  return await ref.read(newsServiceProvider).getAll();
}

@riverpod
Future<News> newsGetByIdController(
  NewsGetByIdControllerRef ref,
  String id,
) async {
  return await ref.read(newsServiceProvider).getById(id);
}
