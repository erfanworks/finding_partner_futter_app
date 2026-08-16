import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendSeirusController extends GetxController {
  var balance = 2450.obs;
  var selectedAmount = 100.obs; 

  final TextEditingController customAmountController = TextEditingController();

  final List<int> amounts = [50, 100, 200, 500];

  void selectAmount(int amount) {
    selectedAmount.value = amount;
    customAmountController.clear();
  }

  @override
  void onClose() {
    customAmountController.dispose();
    super.onClose();
  }
}