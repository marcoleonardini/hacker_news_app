import 'package:flutter/foundation.dart';
import 'package:hacker_news_app/src/core/models/story.model.dart';
import 'package:hacker_news_app/src/services/stories.service.dart';

class StoryProvider extends ChangeNotifier {
  List<int> _topStoriesIds = [];

  void getStories() async {
    _topStoriesIds = await StoryService().getTopStories();
    notifyListeners();
  }

  List<int> get topStoriesIds => _topStoriesIds;
}
