import 'package:flutter/material.dart';

class ShowTimeButton extends StatelessWidget {
  final String time;

  const ShowTimeButton({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF2F2F2F),
      ),

      onPressed: () {},

      child: Text(time),
    );
  }
}