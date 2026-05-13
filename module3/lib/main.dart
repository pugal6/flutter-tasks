import 'package:flutter/material.dart';
import 'package:module3/mini%20challenge1/models/event.dart';
import 'package:module3/mini%20challenge1/providers/booking_provider.dart';
import 'package:module3/mini%20challenge1/screens/event_details_screen.dart';
import 'package:module3/mini%20challenge1/screens/home_screen.dart';
import 'package:module3/mini%20challenge1/screens/ticket_confirmation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookingProvider(),
      child: const EventApp(),
    ),
  );
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Manager',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == EventDetailsScreen.routeName) {
          final event = settings.arguments as Event;

          return MaterialPageRoute(
            builder: (context) {
              return EventDetailsScreen(event: event);
            },
          );
        }

        if (settings.name == TicketConfirmationScreen.routeName) {
          final event = settings.arguments as Event;

          return MaterialPageRoute(
            builder: (context) {
              return TicketConfirmationScreen(event: event);
            },
          );
        }

        return null;
      },
    );
  }
}