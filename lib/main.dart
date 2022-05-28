import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sample_level_1/news_change_notifier.dart';
import 'sample_level_1/news_page.dart';
import 'sample_level_1/news_service.dart';

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
