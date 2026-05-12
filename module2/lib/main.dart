import 'package:flutter/material.dart';
import 'package:module2/mini%20challenges/mini%20challenge2/bloc/match_bloc.dart';
import 'package:module2/mini%20challenges/mini%20challenge2/models/match_state.dart';
import 'package:module2/mini%20challenges/mini%20challenge2/widgets/action_button.dart';
import 'package:module2/mini%20challenges/mini%20challenge2/widgets/score_card.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatchScreen(),
    );
  }
}

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  final MatchBloc bloc = MatchBloc();

  Color getStatusColor(String status) {
    switch (status) {
      case "Live":
        return Colors.green;
      case "Paused":
        return Colors.orange;
      case "Finished":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Match Tracker"),
      ),
      body: Center(
        child: StreamBuilder<MatchState>(
          stream: bloc.matchStream,
          initialData: bloc.currentState,
          builder: (context, snapshot) {
            final match = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ScoreCard(
                        teamName: match.teamA,
                        score: match.scoreA,
                      ),
                      ScoreCard(
                        teamName: match.teamB,
                        score: match.scoreB,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(match.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      match.status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  ActionButton(
                    text: "Increase Team A Score",
                    onPressed: bloc.increaseTeamAScore,
                  ),

                  const SizedBox(height: 10),

                  ActionButton(
                    text: "Increase Team B Score",
                    onPressed: bloc.increaseTeamBScore,
                  ),

                  const SizedBox(height: 10),

                  ActionButton(
                    text: "Change Match Status",
                    onPressed: bloc.changeStatus,
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