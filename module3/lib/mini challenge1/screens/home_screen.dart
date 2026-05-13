import 'package:flutter/material.dart';

import '../models/event.dart';
import '../widgets/event_card.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Event> events = [
    Event(
      title: 'Flutter Dev Summit',
      date: 'May 20, 2026',
      location: 'Chennai Trade Center',
      description:
          'Join developers and learn modern Flutter app development.',
    ),
    Event(
      title: 'Music Night Festival',
      date: 'June 2, 2026',
      location: 'Bangalore Arena',
      description:
          'Experience a live concert with top independent artists.',
    ),
    Event(
      title: 'Startup Networking Meetup',
      date: 'June 15, 2026',
      location: 'Coimbatore Hub',
      description:
          'Meet entrepreneurs, founders, and technology enthusiasts.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];

            return EventCard(
              event: event,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  EventDetailsScreen.routeName,
                  arguments: event,
                );
              },
            );
          },
        ),
      ),
    );
  }
}