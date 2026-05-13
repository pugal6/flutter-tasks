import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/event.dart';
import '../providers/booking_provider.dart';
import 'ticket_confirmation_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  static const routeName = '/event-details';

  final Event event;

  const EventDetailsScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    final isBooked = bookingProvider.isBooked(event.title);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(event.location),

            const SizedBox(height: 20),

            Text(event.description),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isBooked
                    ? null
                    : () {
                        bookingProvider.bookEvent(event.title);

                        Navigator.pushNamed(
                          context,
                          TicketConfirmationScreen.routeName,
                          arguments: event,
                        );
                      },
                icon: Icon(
                  isBooked
                      ? Icons.check
                      : Icons.confirmation_number,
                ),
                label: Text(
                  isBooked
                      ? 'Already Booked'
                      : 'Book Ticket',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}