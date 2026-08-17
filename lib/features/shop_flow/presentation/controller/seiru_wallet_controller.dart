import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionModel {
  final int index;
  final String avatarUrl;
  final String title;
  final String subtitle;
  final int amount;
  final bool isDebit; // true = Red Arrow (Debit/Spent), false = Green Arrow (Credit/Received)

  TransactionModel({
    required this.index,
    required this.avatarUrl,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isDebit,
  });
}

class SeiruWalletController extends GetxController {
  final int availableSeiru = 2000;

  final List<TransactionModel> transactions = [
    TransactionModel(
      index: 1,
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Purchased Avatar',
      amount: 50,
      isDebit: true,
    ),
    TransactionModel(
      index: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Gift Received',
      amount: 100,
      isDebit: false,
    ),
    TransactionModel(
      index: 3,
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Send gift (Avatar)',
      amount: 10,
      isDebit: true,
    ),
    TransactionModel(
      index: 4,
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Purchased Avatar',
      amount: 40,
      isDebit: true,
    ),
    TransactionModel(
      index: 5,
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Purchased Avatar',
      amount: 100,
      isDebit: true,
    ),
    TransactionModel(
      index: 6,
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      title: 'Anonymous Supporter',
      subtitle: 'Purchased gift',
      amount: 150,
      isDebit: true,
    ),
  ];

  void onGetSeiruPressed() {
    Get.toNamed(AppRoutes.seiShopScreen);
  }
}