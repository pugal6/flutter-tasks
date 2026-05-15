import 'package:flutter/material.dart';
import 'package:module4/module%20project/services/saved_articles_service.dart';
import '../models/article.dart';

class ArticleDetailScreen
    extends StatefulWidget {
  final Article article;

  const ArticleDetailScreen({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetailScreen> createState() =>
      _ArticleDetailScreenState();
}

class _ArticleDetailScreenState
    extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final isSaved =
        SavedArticlesService.isSaved(
          widget.article,
        );

    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        physics:
            const BouncingScrollPhysics(),

        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,

            backgroundColor: Colors.white,

            elevation: 0,

            leading: Padding(
              padding: const EdgeInsets.all(8),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                        14,
                      ),
                ),

                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(
                      right: 12,
                    ),

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                          14,
                        ),
                  ),

                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        SavedArticlesService
                            .toggleArticle(
                              widget.article,
                            );
                      });
                    },

                    icon: Icon(
                      isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,

                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF3F4F8),
                      Color(0xFFE8ECF7),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Padding(
                  padding:
                      const EdgeInsets.fromLTRB(
                        24,
                        120,
                        24,
                        30,
                      ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    mainAxisAlignment:
                        MainAxisAlignment.end,

                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                        ),

                        child: const Text(
                          'FEATURED',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        widget.article.title,

                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight:
                              FontWeight.bold,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(
                    24,
                    28,
                    24,
                    40,
                  ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,

                        backgroundColor:
                            Color(0xFFF1F3F8),

                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [
                          const Text(
                            'Editorial Team',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            '5 min read',

                            style: TextStyle(
                              color: Colors
                                  .grey
                                  .shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 34),

                  Text(
                    widget.article.body,

                    style: TextStyle(
                      fontSize: 18,
                      height: 2,
                      color:
                          Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}