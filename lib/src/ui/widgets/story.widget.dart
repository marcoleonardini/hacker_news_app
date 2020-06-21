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
    final url = story.url.contains('/') ? story.url.split('/')[2] : story.url;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(story.title),
        subtitle: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(
                'by ${story.by}',
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                '$url',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.blueGrey.withOpacity(0.2),
          child: Text(
            '${story.score}\npts',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ),
        onTap: () {
          if (story.url != '')
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WebViewPage(url: story.url),
              ),
            );
        },
      ),
    );
  }

  void _select(String choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    print(choice);
  }
}
