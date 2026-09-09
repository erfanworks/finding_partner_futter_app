import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PostType { now, scheduled }

class CreatePostController extends GetxController {
  var postType = PostType.now.obs;

  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  var selectedInterest = 'Travel'.obs;
  var selectedDate = Rxn<DateTime>();
  var cleanCriminalRecord = false.obs;
  var selectedGender = 'All'.obs; // All, Male, Female
  var uploadedImagePath = ''.obs;

  final List<Map<String, String>> interests = [
    {'name': 'Travel', 'icon': AppImages.travelImg},
    {'name': 'Business', 'icon': AppImages.businessImg},
    {'name': 'Gaming', 'icon': AppImages.gamingImg},
  ];

  void setPostType(PostType type) {
    postType.value = type;
  }

  void selectInterest(String name) {
    selectedInterest.value = name;
  }

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  void toggleCriminalRecord(bool? val) {
    cleanCriminalRecord.value = val ?? false;
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.onClose();
  }
}