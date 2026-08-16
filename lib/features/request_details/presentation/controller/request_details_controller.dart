import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestDetailsController extends GetxController {
  final customAmountController = TextEditingController();
  final noteController = TextEditingController(
    text: "Seeking a travel companion for the upcoming tech expo in Tokyo. Expenses shared.",
  );

  @override
  void onClose() {
    customAmountController.dispose();
    noteController.dispose();
    super.onClose();
  }


  var userName = 'mohammadshakil'.obs;
  var categoryTitle = 'Travel'.obs;
  var dateTimeText = '02 october, 2PM'.obs;

  void onDeclineConfirm() {

    Get.back(result: true);
  }

  void onCancel() {
    Get.back(result: false);
  }


  var userAcceptName = 'mohammadshakil'.obs;
  var categoryAcceptTitle = 'Travel'.obs;
  var dateAcceptTimeText = '02 october, 2PM'.obs;

  void onAcceptConfirm() {
    Get.back(result: true);
  }

  void onAcceptCancel() {
    Get.back(result: false);
  }
}