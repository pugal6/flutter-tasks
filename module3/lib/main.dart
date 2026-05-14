import 'package:flutter/material.dart';
import 'package:module3/module%20project/providers/assignment_provider.dart';
import 'package:provider/provider.dart';

import 'module project/router/app_router.dart';



void main() {
  runApp(const StudyHubApp());
}

class StudyHubApp extends StatelessWidget {
  const StudyHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AssignmentProvider(),
        ),
      ],

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'StudyHub',

        theme: ThemeData(
          useMaterial3: true,

          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            brightness: Brightness.light,
          ),

          scaffoldBackgroundColor:
              const Color(0xfff4f7fb),

          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),

          cardTheme: CardThemeData(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20),
            ),
          ),
        ),

        routerConfig: appRouter,
      ),
    );
  }
}