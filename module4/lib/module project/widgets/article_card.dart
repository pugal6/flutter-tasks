import 'package:flutter/material.dart';
import 'package:module4/module%20project/services/saved_articles_service.dart';
import '../models/article.dart';
import '../screens/article_detail_screen.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onSave;
  final VoidCallback onRefresh;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onSave,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final isSaved =
        SavedArticlesService.isSaved(article);

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,

          MaterialPageRoute(
            builder:
                (_) => ArticleDetailScreen(
                  article: article,
                ),
          ),
        );

        onRefresh();
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(26),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.04,
              ),

              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFF3F4F6,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                    ),

                    child: const Text(
                      'ARTICLE',

                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: onSave,

                    child: Icon(
                      isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,

                      size: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                article.title,

                maxLines: 3,

                overflow:
                    TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Text(
                  article.body,

                  maxLines: 4,

                  overflow:
                      TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.6,
                    color:
                        Colors.grey.shade700,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const CircleAvatar(
                    radius: 14,

                    backgroundColor:
                        Color(0xFFF3F4F6),

                    child: Icon(
                      Icons.person,
                      size: 14,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      'Editorial',

                      overflow:
                          TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 12,
                        color:
                            Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}