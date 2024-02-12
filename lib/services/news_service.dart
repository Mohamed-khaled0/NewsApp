import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=b1dfdb3063c241f1816ea52655395a65&category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel? articleModel = ArticleModel.fromJson(article);

        // Check for non-null properties before adding to the list
        if (articleModel?.image != null &&
            articleModel?.title != null &&
            articleModel?.subTitle != null) {
          articlesList.add(articleModel!);
        }
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }

  getNews() {}
}
