import 'dart:convert';

import 'package:hacker_news_app/src/core/const/urls.dart';
import 'package:http/http.dart' as http;

import 'package:hacker_news_app/src/core/models/story.model.dart';

abstract class StoryServiceBase {
  Future<List<int>> getTopStories();
}

class StoryService with StoryServiceBase {
  @override
  Future<List<int>> getTopStories() async {
    var response = await http.get(Urls.getTopStories());

    List x = jsonDecode(response.body);

    List<int> listStories = [];
    x.forEach((element) {
      listStories.add(element);
    });
    return listStories;
  }

  Future<Story> getStory(int id) async {
    print(id);
    var response = await http.get(Urls.getStorie(id));
    var x = jsonDecode(response.body);

    return Story.fromJson(x);
  }
}
