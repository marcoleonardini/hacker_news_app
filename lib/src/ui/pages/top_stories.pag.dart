import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/providers/story.provider.dart';
import 'package:hacker_news_app/src/services/stories.service.dart';
import 'package:hacker_news_app/src/ui/pages/webview.page.dart';
import 'package:provider/provider.dart';

class TopStoriesPage extends StatefulWidget {
  @override
  _NewStoriesPageState createState() => _NewStoriesPageState();
}

class _NewStoriesPageState extends State<TopStoriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          return Provider.of<StoryProvider>(context, listen: false)
              .getNewStories();
          // Future.delayed(Duration(seconds: 2));
        },
        child: Consumer<StoryProvider>(
          builder: (context, storyProvider, widget) {
            print(storyProvider.topStoriesIds.length);
            if (storyProvider.topStoriesIds.length == 0) return Container();
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
                      subtitle: Text(
                          'by ${snapshot.data.by} --- ${snapshot.data.id}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewPage(url: snapshot.data.url),
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
    );
  }
}
