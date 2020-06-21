import 'package:flutter/foundation.dart';
import 'package:hacker_news_app/src/core/services/stories.service.dart';

class StoryProvider extends ChangeNotifier {
  List<int> _topStoriesIds = [];
  List<int> _newStoriesIds = [];
  List<int> _bestStoriesIds = [];

  void getNewStories() async {
    _newStoriesIds = [];
    _newStoriesIds = await StoryService().getNewStories();
    notifyListeners();
  }

  void getTopStories() async {
    _topStoriesIds = await StoryService().getTopStories();
    notifyListeners();
  }

  void getBestStories() async {
    _bestStoriesIds = await StoryService().getBestStories();
    notifyListeners();
  }

  List<int> get topStoriesIds => _topStoriesIds;
  List<int> get newStoriesIds => _newStoriesIds;
  List<int> get bestStoriesIds => _bestStoriesIds;
}
