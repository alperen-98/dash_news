import 'package:dash_news/models/article.dart';
import 'package:dash_news/networking/network_helper.dart';
import 'package:dash_news/utilities/constants.dart';
import 'package:flutter/material.dart';

enum TopHeadlinesState { OK, LOADING, ERROR }
enum CategoryHeadlinesState { OK, LOADING, ERROR }

class ArticleProvider with ChangeNotifier {
  ArticleProvider() {
    getTopHeadlines();
    getArticlesByCategory(selectedCategory);
  }

  List<Article> _topHeadlines = List.empty(growable: true);
  List<Article> _categoryHeadlines = List.empty(growable: true);

  //unmodifiable list
  List<Article> get topHeadlines => [..._topHeadlines];
  List<Article> get categoryHeadlines => [..._categoryHeadlines];

  late TopHeadlinesState _thState;
  late CategoryHeadlinesState _chState;

  TopHeadlinesState get thState => _thState;
  CategoryHeadlinesState get chState => _chState;

  set thState(TopHeadlinesState state) {
    _thState = state;
    notifyListeners();
  }

  set chState(CategoryHeadlinesState state) {
    _chState = state;
    notifyListeners();
  }

  String? _selectedCountry;
  String? _selectedCategory;

  String get country => _selectedCountry ?? 'us';
  String get selectedCategory => _selectedCategory ?? 'general';

  void setCategory(String newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void setCountry(String country) {
    _selectedCountry = country;
    getTopHeadlines();
    getArticlesByCategory(selectedCategory);
  }

  Future<void> getTopHeadlines() async {
    final topHeadlinesURL =
        '${newsApiURL}top-headlines?country=$country&apiKey=$apiKey';

    try {
      thState = TopHeadlinesState.LOADING;
      _topHeadlines = await NetworkHelper().getArticles(topHeadlinesURL);
      thState = TopHeadlinesState.OK;
    } catch (error) {
      thState = TopHeadlinesState.ERROR;
    }

    notifyListeners();
  }

  Future<void> getArticlesByCategory(String category) async {
    final url =
        '${newsApiURL}top-headlines?country=$country&category=$category&apiKey=$apiKey';
    try {
      chState = CategoryHeadlinesState.LOADING;
      _categoryHeadlines = await NetworkHelper().getArticles(url);
      chState = CategoryHeadlinesState.OK;
    } catch (error) {
      chState = CategoryHeadlinesState.ERROR;
    }

    notifyListeners();
  }
}
