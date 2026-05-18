import 'package:flutter/material.dart';
import '../services/journal_database_service.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() =>
      _JournalScreenState();
}

class _JournalScreenState
    extends State<JournalScreen> {
  final TextEditingController controller =
      TextEditingController();

  List<Map<String, dynamic>> entries = [];

  @override
  void initState() {
    super.initState();
    loadEntries();
  }

  Future<void> loadEntries() async {
    final loadedEntries =
        await JournalDatabaseService.getEntries();

    setState(() {
      entries = loadedEntries;
    });
  }

  Future<void> addEntry() async {
    if (controller.text.trim().isEmpty) return;

    await JournalDatabaseService.addEntry(
      controller.text.trim(),
    );

    controller.clear();

    loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Journal'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEntry,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.05,
                    ),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText:
                      'Write your thoughts here...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.all(20),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: entries.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: 70,
                            color: Colors.grey.shade400,
                          ),

                          const SizedBox(height: 14),

                          Text(
                            'No journal entries yet',
                            style: TextStyle(
                              color:
                                  Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: entries.length,
                      itemBuilder:
                          (context, index) {
                        return Container(
                          margin:
                              const EdgeInsets.only(
                            bottom: 16,
                          ),
                          padding:
                              const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(
                              24,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.05),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.bookmark,
                                color:
                                    Colors.deepPurple,
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  entries[index]
                                      ['entry'],
                                  style:
                                      const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
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