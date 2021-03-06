import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/providers/story.provider.dart';

import 'package:hacker_news_app/src/ui/pages/home.page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StoryProvider>(
      create: (context) => StoryProvider()
        ..getNewStories()
        ..getTopStories()
        ..getBestStories(),
      child: MaterialApp(
        title: 'Hacker News App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: HomePage(),
      ),
    );
  }
}
