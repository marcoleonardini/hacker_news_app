import 'dart:convert';

import 'package:hacker_news_app/src/core/const/urls.dart';
import 'package:http/http.dart' as http;

import 'package:hacker_news_app/src/core/models/story.model.dart';

abstract class StoryServiceBase {
  Future<List<int>> getTopStories();
  Future<List<int>> getNewStories();
  Future<List<int>> getBestStories();
}

class StoryService with StoryServiceBase {
  @override
  Future<List<int>> getTopStories() async {
    List<int> listStories = [];

    try {
      var response = await http.get(Urls.getTopStories());

      listStories = (jsonDecode(response.body) as List<dynamic>).cast<int>();
    } catch (e) {}
    return listStories;
  }

  @override
  Future<List<int>> getNewStories() async {
    List<int> listStories = [];
    try {
      var response = await http.get(Urls.getNewStories());

      listStories = (jsonDecode(response.body) as List<dynamic>).cast<int>();
    } catch (e) {}
    return listStories;
  }

  @override
  Future<List<int>> getBestStories() async {
    List<int> listStories = [];
    try {
      var response = await http.get(Urls.getBestStories());

      listStories = (jsonDecode(response.body) as List<dynamic>).cast<int>();
    } catch (e) {}
    return listStories;
  }

  Future<Story> getStory(int id) async {
    try {
      var response = await http.get(Urls.getStorie(id));
      var x = jsonDecode(response.body);

      return Story.fromJson(x);
    } catch (e) {
      return Story();
    }
  }
}
