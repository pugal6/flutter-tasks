import 'package:module4/module%20project/models/article.dart';

class SavedArticlesService {
  static final List<Article> _savedArticles = [];

  static List<Article> getSavedArticles() {
    return _savedArticles;
  }

  static bool isSaved(Article article) {
    return _savedArticles.any(
      (item) => item.id == article.id,
    );
  }

  static void toggleArticle(Article article) {
    if (isSaved(article)) {
      _savedArticles.removeWhere(
        (item) => item.id == article.id,
      );
    } else {
      _savedArticles.add(article);
    }
  }
}