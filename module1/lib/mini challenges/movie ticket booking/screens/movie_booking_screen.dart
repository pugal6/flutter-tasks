import 'package:flutter/material.dart';
import '../widgets/movie_header_section.dart';
import '../widgets/booking_form_section.dart';

class MovieBookingScreen extends StatelessWidget {
  const MovieBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide =
        MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          "Cinema Booking",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: isWide
              ? Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: MovieHeaderSection(),
                    ),

                    SizedBox(width: 24),

                    Expanded(
                      child: BookingFormSection(),
                    ),
                  ],
                )
              : const Column(
                  children: [
                    MovieHeaderSection(),

                    SizedBox(height: 24),

                    BookingFormSection(),
                  ],
                ),
        ),
      ),
    );
  }
}