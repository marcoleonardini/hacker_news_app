import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/services/stories.service.dart';
import 'package:hacker_news_app/src/ui/pages/webview.page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: FutureBuilder<List<int>>(
            future: StoryService.getTopStories(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              var listIds = snapshot.data;
              return ListView.builder(
                itemCount: listIds.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<Story>(
                    future: StoryService.getStorie(listIds[index]),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      return ListTile(
                        title: Text(snapshot.data.title),
                        subtitle: Text(snapshot.data.by),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  WebViewPage(url: snapshot.data.url),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
