import 'dart:async';

import '../models/match_state.dart';

class MatchBloc {
  final _matchController = StreamController<MatchState>();

  Stream<MatchState> get matchStream => _matchController.stream;

  MatchState _currentState = MatchState(
    teamA: "India",
    teamB: "Australia",
    scoreA: 0,
    scoreB: 0,
    status: "Live",
  );

  MatchState get currentState => _currentState;

  MatchBloc() {
    _matchController.sink.add(_currentState);
  }

void increaseTeamAScore() {

  if (_currentState.status != "Live") {
    return;
  }

  _currentState = _currentState.copyWith(
    scoreA: _currentState.scoreA + 1,
  );

  _matchController.sink.add(_currentState);
}

void increaseTeamBScore() {

  if (_currentState.status != "Live") {
    return;
  }

  _currentState = _currentState.copyWith(
    scoreB: _currentState.scoreB + 1,
  );

  _matchController.sink.add(_currentState);
}

  void changeStatus() {
    String newStatus;

    if (_currentState.status == "Live") {
      newStatus = "Paused";
    } else if (_currentState.status == "Paused") {
      newStatus = "Finished";
    } else {
      newStatus = "Live";
    }

    _currentState = _currentState.copyWith(
      status: newStatus,
    );

    _matchController.sink.add(_currentState);
  }

  void dispose() {
    _matchController.close();
  }
}