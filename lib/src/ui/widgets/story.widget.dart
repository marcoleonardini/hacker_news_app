import 'package:flutter/material.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/ui/pages/webview.page.dart';

class StoryWidget extends StatelessWidget {
  final Story story;
  const StoryWidget({
    Key key,
    @required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(story.title),
      subtitle: Text('by ${story.by} --- ${story.url}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WebViewPage(url: story.url),
          ),
        );
      },
    );
  }
}
