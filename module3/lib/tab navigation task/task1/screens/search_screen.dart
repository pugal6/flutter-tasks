import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search songs or artists',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Trending Searches',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('Shape of You'),
                ),
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('Believer'),
                ),
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('Levitating'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}