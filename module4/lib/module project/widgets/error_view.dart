import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorView({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Container(
          padding: const EdgeInsets.all(28),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(28),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.05,
                ),

                blurRadius: 10,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Container(
                padding:
                    const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.red.shade50,

                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.wifi_off_rounded,
                  size: 38,
                  color: Colors.red.shade400,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Failed to load articles',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Please check your internet connection and try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: onRetry,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(
                          0xFF4F46E5,
                        ),

                    foregroundColor:
                        Colors.white,

                    padding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                    ),
                  ),

                  child: const Text(
                    'Try Again',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}