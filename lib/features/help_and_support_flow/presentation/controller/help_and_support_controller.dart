import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var isLoading = false.obs;

  void submitTicket() {
    FocusManager.instance.primaryFocus?.unfocus();

    String subject = subjectController.text.trim();
    String description = descriptionController.text.trim();

    if (subject.isEmpty || description.isEmpty) {
      Get.snackbar(
        'Warning',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber.shade800,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    // API Call Simulation
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Success',
        'Your ticket has been submitted successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}