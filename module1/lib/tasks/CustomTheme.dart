import 'package:flutter/material.dart';


class CustomTheme extends StatelessWidget {
  const CustomTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Custom Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          //elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      home: const MeditationWelcomeScreen(),
    );
  }
}

class MeditationWelcomeScreen extends StatelessWidget {
  const MeditationWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Accessing theme values
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: const Text(
          "Meditation",
        ),
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.self_improvement,
              size: 100,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 30),

            Text(
              "Relax Your Mind",
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "Take a deep breath and begin your peaceful meditation journey.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),

              child: const Text(
                "Start Session",
              ),
            ),
          ],
        ),
      ),
    );
  }
}