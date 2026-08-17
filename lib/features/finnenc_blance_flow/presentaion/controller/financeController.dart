import 'package:get/get.dart';

class TransactionItem {
  final String id;
  final String name;
  final String date;
  final String amount;
  final String avatarUrl;

  TransactionItem({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.avatarUrl,
  });
}

class FinanceController extends GetxController {
  // Payout Setting Radio State
  String payoutSetting = 'Scheduled'; // 'Scheduled' or 'Manual'

  // Overview Filter Dropdown State
  String selectedTimeframe = 'This year';
  final List<String> timeframes = ['This week', 'This month', 'This year'];

  // Static Data
  final String coinCount = '999';
  final String totalEarnings = '\$1284.50';
  final String nextPayoutDate = 'March 21';

  final List<TransactionItem> recentTransactions = [
    TransactionItem(
      id: '1',
      name: 'Jhon Doe',
      date: 'March 14',
      amount: '\$224.20',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    TransactionItem(
      id: '2',
      name: 'Jhon Doe',
      date: 'March 14',
      amount: '\$224.20',
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    TransactionItem(
      id: '3',
      name: 'Jhon Doe',
      date: 'March 14',
      amount: '\$224.20',
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
    ),
  ];

  void setPayoutSetting(String value) {
    payoutSetting = value;
    update();
  }

  void setTimeframe(String value) {
    selectedTimeframe = value;
    update();
  }
}