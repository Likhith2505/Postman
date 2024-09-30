import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_providers.dart';
import '../widgets/news_list_item.dart';
import '../widgets/category_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeed = ref.watch(newsFeedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100, child: CategoryList()),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.refresh(newsFeedProvider.future),
              child: newsFeed.when(
                data: (articles) => ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) => NewsListItem(article: articles[index]),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}