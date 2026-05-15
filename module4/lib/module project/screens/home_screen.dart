import 'package:flutter/material.dart';
import 'package:module4/module%20project/services/saved_articles_service.dart';
import '../models/article.dart';
import '../services/article_service.dart';
import '../widgets/article_card.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Article>> futureArticles;

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    futureArticles =
        ArticleService.fetchArticles();
  }

  Future<void> refreshArticles() async {
    setState(() {
      futureArticles =
          ArticleService.fetchArticles(
            forceRefresh: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedArticles =
        SavedArticlesService.getSavedArticles();

    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F5F7,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),

              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF111827),
                    Color(0xFF1F2937),
                  ],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius:
                    BorderRadius.circular(32),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.all(
                              14,
                            ),

                        decoration: BoxDecoration(
                          color: Colors.white12,

                          borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                        ),

                        child: const Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),

                        decoration: BoxDecoration(
                          color: Colors.white12,

                          borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                        ),

                        child: Text(
                          '${savedArticles.length} Saved',

                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 26),

                  const Text(
                    'Daily Reader',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Explore curated articles and save your favorites for later reading.',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },

                      child: AnimatedContainer(
                        duration:
                            const Duration(
                              milliseconds: 250,
                            ),

                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                        decoration: BoxDecoration(
                          color:
                              selectedTab == 0
                                  ? Colors.black
                                  : Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                        ),

                        child: Text(
                          'Articles',

                          textAlign:
                              TextAlign.center,

                          style: TextStyle(
                            color:
                                selectedTab == 0
                                    ? Colors.white
                                    : Colors.black,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },

                      child: AnimatedContainer(
                        duration:
                            const Duration(
                              milliseconds: 250,
                            ),

                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                        decoration: BoxDecoration(
                          color:
                              selectedTab == 1
                                  ? Colors.black
                                  : Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                        ),

                        child: Text(
                          'Saved',

                          textAlign:
                              TextAlign.center,

                          style: TextStyle(
                            color:
                                selectedTab == 1
                                    ? Colors.white
                                    : Colors.black,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Expanded(
              child:
                  selectedTab == 0
                      ? FutureBuilder<List<Article>>(
                        future: futureArticles,

                        builder: (
                          context,
                          snapshot,
                        ) {
                          if (snapshot
                                  .connectionState ==
                              ConnectionState
                                  .waiting) {
                            return const LoadingView();
                          }

                          if (snapshot.hasError) {
                            return ErrorView(
                              onRetry:
                                  refreshArticles,
                            );
                          }

                          final articles =
                              snapshot.data!;

                          return RefreshIndicator(
                            onRefresh:
                                refreshArticles,

                            child: GridView.builder(
                              padding:
                                  const EdgeInsets.fromLTRB(
                                    20,
                                    0,
                                    20,
                                    20,
                                  ),

                              physics:
                                  const BouncingScrollPhysics(),

                             gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,

      crossAxisSpacing: 14,
      mainAxisSpacing: 14,

      mainAxisExtent: 210,
    ),

                              itemCount:
                                  articles.length,

                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return ArticleCard(
                                  article:
                                      articles[index],

                                  onSave: () {
                                    setState(() {
                                      SavedArticlesService
                                          .toggleArticle(
                                            articles[index],
                                          );
                                    });
                                  },

                                  onRefresh: () {
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                          );
                        },
                      )
                      : savedArticles.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(
                                    22,
                                  ),

                              decoration: BoxDecoration(
                                color:
                                    Colors.white,

                                borderRadius:
                                    BorderRadius.circular(
                                      24,
                                    ),
                              ),

                              child: const Icon(
                                Icons.bookmark_border,
                                size: 40,
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            const Text(
                              'No Saved Articles',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            Text(
                              'Articles you save will appear here.',
                              style: TextStyle(
                                color: Colors
                                    .grey
                                    .shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                      : GridView.builder(
                        padding:
                            const EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              20,
                            ),

                       gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,

      crossAxisSpacing: 14,
      mainAxisSpacing: 14,

      mainAxisExtent: 210,
    ),

                        itemCount:
                            savedArticles.length,

                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return ArticleCard(
                            article:
                                savedArticles[index],

                            onSave: () {
                              setState(() {
                                SavedArticlesService
                                    .toggleArticle(
                                      savedArticles[index],
                                    );
                              });
                            },

                            onRefresh: () {
                              setState(() {});
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}