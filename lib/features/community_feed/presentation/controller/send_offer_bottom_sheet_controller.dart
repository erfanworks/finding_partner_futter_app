import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RateType { hourly, fixed }

class SendOfferController extends GetxController {
  final priceController = TextEditingController();
  final messageController = TextEditingController();

  var selectedRateType = RateType.hourly.obs;

  void setRateType(RateType type) {
    selectedRateType.value = type;
  }

  void sendOffer() {
    final rate = priceController.text;
    final message = messageController.text;
    final rateType = selectedRateType.value;

    // Send offer logic here
    print('Rate Type: $rateType, Rate: $rate, Message: $message');
    Get.back();
  }

  @override
  void onClose() {
    priceController.dispose();
    messageController.dispose();
    super.onClose();
  }
}