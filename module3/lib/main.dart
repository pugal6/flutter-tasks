import 'package:flutter/material.dart';
import 'package:module3/named%20route%20task/screens/cafeteria_screen.dart';
import 'package:module3/named%20route%20task/screens/campus_home_screen.dart';
import 'package:module3/named%20route%20task/screens/library_screen.dart';
import 'package:module3/named%20route%20task/screens/notes_home_screen.dart';
import 'package:module3/named%20route%20task/screens/page_not_found_screen.dart';
import 'package:module3/named%20route%20task/screens/saved_notes_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/': (context) => const MainMenuScreen(),

        // Campus App Routes
        '/campus-home': (context) => const CampusHomeScreen(),
        '/library': (context) => const LibraryScreen(),
        '/cafeteria': (context) => const CafeteriaScreen(),

        // Notes App Routes
        '/notes-home': (context) => const NotesHomeScreen(),
        '/saved-notes': (context) => const SavedNotesScreen(),
      },

      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundScreen(),
        );
      },
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Practice Apps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/campus-home');
              },
              child: const Text('Open Campus App'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notes-home');
              },
              child: const Text('Open Notes App'),
            ),
          ],
        ),
      ),
    );
  }
}