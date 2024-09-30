import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';
import '../utils/constants.dart';

class NewsService {
  Future<List<NewsArticle>> fetchNewsFeed() async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/news-feed'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news feed');
    }
  }

  Future<List<String>> fetchNewsSectionNames() async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/news-section-names'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.cast<String>();
    } else {
      throw Exception('Failed to load section names');
    }
  }

  Future<List<NewsArticle>> fetchNewsSection(List<String> sectionNames) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/news-section'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'sectionNames': sectionNames}),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news for sections');
    }
  }
}
