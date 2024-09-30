import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_providers.dart';
import '../widgets/news_list_item.dart';

class CategoryScreen extends ConsumerWidget {
  final String category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryNews = ref.watch(newsSectionProvider([category]));

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(newsSectionProvider([category]).future),
        child: categoryNews.when(
          data: (articles) => ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) => NewsListItem(article: articles[index]),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
