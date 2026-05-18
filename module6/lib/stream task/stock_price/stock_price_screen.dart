import 'package:flutter/material.dart';

import 'stock_service.dart';

class StockPriceScreen extends StatefulWidget {
  const StockPriceScreen({super.key});

  @override
  State<StockPriceScreen> createState() =>
      _StockPriceScreenState();
}

class _StockPriceScreenState
    extends State<StockPriceScreen> {
  final StockService stockService = StockService();

  double previousPrice = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Live Stock Price"),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<double>(
          stream: stockService.getStockPriceStream(),
          initialData: 150,
          builder: (context, snapshot) {
            final price = snapshot.data ?? 0;

            final bool isUp = price >= previousPrice;

            previousPrice = price;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color:
                      isUp ? Colors.green : Colors.red,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isUp
                                ? Colors.green
                                : Colors.red)
                            .withOpacity(0.3),
                    blurRadius: 18,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "AAPL",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color:
                          isUp
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isUp
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color:
                            isUp
                                ? Colors.green
                                : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isUp
                            ? "Stock Rising"
                            : "Stock Falling",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              isUp
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}