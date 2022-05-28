import 'package:flutter/material.dart';
import 'package:flutter_tutorial/article.dart';
import 'package:provider/provider.dart';

import 'news_change_notifier.dart';
import 'news_page.dart';
import 'news_service.dart';

class MockNewsService implements NewsService {
  @override
  Future<List<Article>> getArticles() async {
    return [
      Article(title: "Test 1", content: "Content 1"),
      Article(title: "Test 2", content: "Content 2"),
      Article(title: "Test 3", content: "Content 3")
    ];
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(NewsService()),
        child: NewsPage(),
      ),
    );
  }
}
