import 'package:flutter/material.dart';
import 'custom_input_field.dart';
import 'show_time_button.dart';

class BookingFormSection extends StatelessWidget {
  const BookingFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1B),

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            "Reserve Your Seats",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 26),

          const CustomInputField(
            label: "Full Name",
            icon: Icons.person,
          ),

          const SizedBox(height: 18),

          const CustomInputField(
            label: "Email or Phone Number",
            icon: Icons.email,
          ),

          const SizedBox(height: 18),

          const CustomInputField(
            label: "Number of Tickets",
            icon: Icons.confirmation_number,
          ),

          const SizedBox(height: 28),

          const Text(
            "Select Show Timing",

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 12,
            runSpacing: 12,

            children: const [
              ShowTimeButton(time: "10:00 AM"),
              ShowTimeButton(time: "1:30 PM"),
              ShowTimeButton(time: "5:00 PM"),
              ShowTimeButton(time: "9:00 PM"),
            ],
          ),


           const SizedBox(height: 30),

  Container(
    padding: const EdgeInsets.all(20),

    decoration: BoxDecoration(
      color: const Color(0xFF2A2A2A),

      borderRadius: BorderRadius.circular(24),
    ),

    child: Row(
      children: [
        const Icon(
          Icons.event_seat,
          color: Colors.orangeAccent,
          size: 36,
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: const [
              Text(
                "Booking Summary",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              SizedBox(height: 6),

              Text(
                "2 Tickets • Spider-Verse • 5:00 PM",

                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        const Text(
          "\$32",

          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
        ),
      ],
    ),
  ),

  const SizedBox(height: 30),

  SizedBox(
    width: double.infinity,

    child: ElevatedButton.icon(
      onPressed: () {},

      icon: const Icon(
        Icons.movie_filter,
      ),

      label: const Text(
        "Confirm Booking",

        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),


        ],
      ),



      
    );
  }
}