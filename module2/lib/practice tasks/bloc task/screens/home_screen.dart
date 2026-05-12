import 'package:flutter/material.dart';

import '../blocs/battery_bloc.dart';
import '../blocs/score_bloc.dart';
import '../models/match_score.dart';
import '../widgets/battery_card.dart';
import '../widgets/score_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BatteryBloc batteryBloc = BatteryBloc();
  final ScoreBloc scoreBloc = ScoreBloc();

  @override
  void dispose() {
    batteryBloc.dispose();
    scoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams and BLoC"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StreamBuilder<int>(
              stream: batteryBloc.batteryStream,
              initialData: 50,
              builder: (context, snapshot) {
                return BatteryCard(
                  batteryLevel: snapshot.data ?? 0,
                  onPressed: batteryBloc.changeBattery,
                );
              },
            ),

            const SizedBox(height: 30),

            StreamBuilder<MatchScore>(
              stream: scoreBloc.scoreStream,
              initialData: MatchScore(
                homeScore: 0,
                awayScore: 0,
              ),
              builder: (context, snapshot) {
                final score = snapshot.data!;

                return ScoreCard(
                  homeScore: score.homeScore,
                  awayScore: score.awayScore,
                  onHomeGoal: scoreBloc.incrementHome,
                  onAwayGoal: scoreBloc.incrementAway,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}