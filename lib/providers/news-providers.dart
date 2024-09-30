import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/news_service.dart';
import '../models/news_article.dart';

final newsServiceProvider = Provider((ref) => NewsService());

final newsFeedProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final newsService = ref.read(newsServiceProvider);
  return newsService.fetchNewsFeed();
});

final newsSectionNamesProvider = FutureProvider<List<String>>((ref) async {
  final newsService = ref.read(newsServiceProvider);
  return newsService.fetchNewsSectionNames();
});

final newsSectionProvider = FutureProvider.family<List<NewsArticle>, List<String>>((ref, sectionNames) async {
  final newsService = ref.read(newsServiceProvider);
  return newsService.fetchNewsSection(sectionNames);
});
