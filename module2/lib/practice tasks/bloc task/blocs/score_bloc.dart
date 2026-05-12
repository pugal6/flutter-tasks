import 'dart:async';

import '../models/match_score.dart';

class ScoreBloc {
  final StreamController<MatchScore> _scoreController =
      StreamController<MatchScore>();

  int _homeScore = 0;
  int _awayScore = 0;

  Stream<MatchScore> get scoreStream => _scoreController.stream;

  void incrementHome() {
    _homeScore++;

    _scoreController.sink.add(
      MatchScore(
        homeScore: _homeScore,
        awayScore: _awayScore,
      ),
    );
  }

  void incrementAway() {
    _awayScore++;

    _scoreController.sink.add(
      MatchScore(
        homeScore: _homeScore,
        awayScore: _awayScore,
      ),
    );
  }

  void dispose() {
    _scoreController.close();
  }
}