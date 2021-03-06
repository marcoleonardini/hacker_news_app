import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/core/providers/story.provider.dart';
import 'package:hacker_news_app/src/core/services/stories.service.dart';
import 'package:hacker_news_app/src/ui/widgets/story.widget.dart';
import 'package:provider/provider.dart';

class NewStoriesPage extends StatefulWidget {
  @override
  _NewStoriesPageState createState() => _NewStoriesPageState();
}

class _NewStoriesPageState extends State<NewStoriesPage>
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
        },
        child: Consumer<StoryProvider>(
          builder: (context, storyProvider, widget) {
            if (storyProvider.newStoriesIds.length == 0) return Container();
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: storyProvider.newStoriesIds.length,
              itemBuilder: (context, index) {
                return FutureBuilder<Story>(
                  future: StoryService()
                      .getStory(storyProvider.newStoriesIds[index]),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return ListTile(
                        title: Text('Loading...'),
                      );
                    return StoryWidget(story: snapshot.data);
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
