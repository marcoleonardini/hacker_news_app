class Urls {
  static final _baseUrl = 'https://hacker-news.firebaseio.com/v0/';
  static final _topStories = 'topstories.json';
  static final _newStories = 'newstories.json';
  static final _bestStories = 'beststories.json';
  static final _storie = 'item/';

  static String getTopStories() => _baseUrl + _topStories;
  static String getBestStories() => _baseUrl + _bestStories;
  static String getNewStories() => _baseUrl + _newStories;
  static String getStorie(int id) => _baseUrl + _storie + '$id.json';
}
