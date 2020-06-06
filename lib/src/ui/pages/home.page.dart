import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/providers/story.provider.dart';
import 'package:hacker_news_app/src/services/stories.service.dart';
import 'package:hacker_news_app/src/ui/pages/webview.page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Consumer<StoryProvider>(
            builder: (context, storyProvider, widget) {
              print(storyProvider.topStoriesIds.length);
              if (storyProvider.topStoriesIds.length == 0)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return ListView.builder(
                itemCount: storyProvider.topStoriesIds.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<Story>(
                    future: StoryService()
                        .getStory(storyProvider.topStoriesIds[index]),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return ListTile(
                          title: Text('Loading...'),
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
