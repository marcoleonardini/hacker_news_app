import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/ui/pages/best_stories.page.dart';

import 'package:hacker_news_app/src/ui/pages/new_stories.page.dart';
import 'package:hacker_news_app/src/ui/pages/top_stories.pag.dart';
import 'package:hacker_news_app/src/ui/widgets/tab_indicator.decoration.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Hacker News',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TabBar(
                  unselectedLabelColor: Colors.redAccent,
                  labelColor: Colors.red,
                  indicator: CircleTabIndicator(color: Colors.red, radius: 4.0),
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      child: Text('News'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      child: Text('Top'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      child: Text('Best'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      NewStoriesPage(),
                      TopStoriesPage(),
                      BestStoriesPage(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
