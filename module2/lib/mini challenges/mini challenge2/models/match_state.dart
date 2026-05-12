class MatchState {
  final String teamA;
  final String teamB;
  final int scoreA;
  final int scoreB;
  final String status;

  MatchState({
    required this.teamA,
    required this.teamB,
    required this.scoreA,
    required this.scoreB,
    required this.status,
  });

  MatchState copyWith({
    int? scoreA,
    int? scoreB,
    String? status,
  }) {
    return MatchState(
      teamA: teamA,
      teamB: teamB,
      scoreA: scoreA ?? this.scoreA,
      scoreB: scoreB ?? this.scoreB,
      status: status ?? this.status,
    );
  }
}