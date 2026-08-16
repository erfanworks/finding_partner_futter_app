import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewBookingController extends GetxController {

  var selectedTipIndex = 1.obs;

  final TextEditingController customTipController = TextEditingController();
  final TextEditingController requestController = TextEditingController(
    text: "Seeking a travel companion for the upcoming tech expo in Tokyo. Expenses shared.",
  );

  void selectTip(int index) {
    selectedTipIndex.value = index;
    customTipController.clear();
  }

  @override
  void onClose() {
    customTipController.dispose();
    requestController.dispose();
    super.onClose();
  }
}