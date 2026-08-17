import 'package:get/get.dart';

class PaymentMethod {
  final String id;
  final String title;
  final String subtitle;

  PaymentMethod({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}

class TransactionModel {
  final String avatarUrl;
  final String title;
  final String subtitle;
  final String amount;
  final bool isCopyable;

  TransactionModel({
    required this.avatarUrl,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.isCopyable = false,
  });
}

class WalletController extends GetxController {
  // Tab Management
  final RxInt selectedTabIndex = 0.obs;

  // Withdraw State
  final RxString withdrawAmount = '150.00'.obs;
  final RxString selectedAccount = 'master_card'.obs;

  // Balance Data
  final String coinCount = '999';
  final String payoutsBalance = '\$408.00';
  final String availableForWithdrawal = '\$200.00';
  final String pendingBalance = '\$140.00';

  final String bookingsBalance = '\$408.00';
  final String tipsBalance = '\$220.00';

  // Accounts List for Withdraw
  final List<PaymentMethod> accounts = [
    PaymentMethod(
      id: 'master_card',
      title: 'Master Card',
      subtitle: 'Master Card • **** **** **** 4321- 4/2030',
    ),
    PaymentMethod(
      id: 'visa_card',
      title: 'Visa card',
      subtitle: 'Master Card • **** **** **** 4321- 4/2030',
    ),
  ];

  // Bookings Items
  final List<TransactionModel> bookingsTransactions = List.generate(
    6,
        (index) => TransactionModel(
      avatarUrl: index.isEven
          ? 'https://i.pravatar.cc/150?img=9'
          : 'https://i.pravatar.cc/150?img=11',
      title: index.isEven ? 'jasikajonson, 21' : 'jhondoe, 27',
      subtitle: 'Order id: #123456',
      amount: '\$408.00',
      isCopyable: true,
    ),
  );

  // Tips Items
  final List<TransactionModel> tipsTransactions = [
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      title: 'jasikajonson, 21',
      subtitle: 'Tips',
      amount: '\$40.00',
    ),
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      title: 'jhondoe, 27',
      subtitle: 'Tips',
      amount: '480 Seirus',
    ),
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      title: 'jasikajonson, 21',
      subtitle: 'Tips',
      amount: '\$40.00',
    ),
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      title: 'jasikajonson, 21',
      subtitle: 'Tips',
      amount: '\$40.00',
    ),
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      title: 'jhondoe, 27',
      subtitle: 'Tips',
      amount: '\$48.00',
    ),
    TransactionModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      title: 'jhondoe, 27',
      subtitle: 'Tips',
      amount: '\$10.00',
    ),
  ];

  void setTab(int index) {
    selectedTabIndex.value = index;
  }
}