import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app.dart';

void main() {
  testWidgets('NewsApp widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: NewsApp()));

    // Verify that the app starts with the title 'News Feed'.
    expect(find.text('News Feed'), findsOneWidget);

    // Verify that there's a CircularProgressIndicator while loading.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // You can add more widget tests here as you develop your app.
  });
}
