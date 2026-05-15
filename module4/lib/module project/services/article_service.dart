import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ArticleService {
  static List<Article>? _cachedArticles;

  static Future<List<Article>> fetchArticles({
    bool forceRefresh = false,
  }) async {
    if (_cachedArticles != null && !forceRefresh) {
      return _cachedArticles!;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_limit=20',
        ),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        final articles =
            data.map((json) {
              final title =
                  json['title']
                      .toString()
                      .replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');

              final body =
                  json['body']
                      .toString()
                      .replaceAll(RegExp(r'[^a-zA-Z0-9\s.,]'), '');

              return Article(
                id: json['id'],
                title: _formatText(title),
                body: _formatText(body),
              );
            }).toList();

        _cachedArticles = articles;

        return articles;
      } else {
        throw Exception(
          'Failed to load articles',
        );
      }
    } catch (e) {
      throw Exception(
        'Something went wrong',
      );
    }
  }

  static String _formatText(String text) {
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() +
              word.substring(1).toLowerCase();
        })
        .join(' ');
  }
}