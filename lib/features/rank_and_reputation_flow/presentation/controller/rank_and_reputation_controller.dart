import 'package:get/get.dart';

class StatItem {
  final String value;
  final String label;

  StatItem({required this.value, required this.label});
}

class RankReputationController extends GetxController {
  final String currentRank = 'Top Companion';
  final String rankSubtitle = 'Top 1% in miami';

  final List<StatItem> stats = [
    StatItem(value: '4.5', label: 'Ratings'),
    StatItem(value: '128', label: 'Reviews'),
    StatItem(value: '98%', label: 'Response rate'),
    StatItem(value: '96%', label: 'Completion'),
  ];

  final int currentProgress = 72;
  final int totalProgress = 150;
  final int reviewsNeeded = 78;

  void onViewLeaderboard() {
    // Leaderboard Action
  }
}