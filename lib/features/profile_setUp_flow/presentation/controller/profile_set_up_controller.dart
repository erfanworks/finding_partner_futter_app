import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/profile_setup_success_screen.dart';

class ProfileSetUpController extends GetxController {
  final PageController pageController = PageController();
  int currentStep = 0;

  // Step 1: Gender & DOB
  String selectedGender = 'Male';
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  // Step 2: Location & Language
  String selectedCountry = 'Germany';
  String selectedCity = 'Berlin';
  String selectedLanguage = 'English';
  String selectedProficiency = 'Native';

  // Step 3: Interests
  List<String> selectedInterests = ['Travel'];
  final List<Map<String, String>> interestOptions = [
    {'title': 'Travel', 'icon': '✈️'},
    {'title': 'Business', 'icon': '💼'},
    {'title': 'Fitness', 'icon': '🏋️'},
    {'title': 'Gaming', 'icon': '🎮'},
    {'title': 'Activities', 'icon': '🍿'},
    {'title': 'Networking', 'icon': '☕'},
  ];

  // Step 4: Verification
  bool isIdentityVerified = false;
  bool isCriminalCheckUploaded = false;


  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController(
    text: "Curious traveler & foodie. Looking to meet locals in new cities.",
  );

  void setStep(int step) {
    currentStep = step;
    update();
  }

  void nextPage() {
    if (currentStep < 4) {
      currentStep++;
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      Get.offAll(() => const ProfileSetupSuccessScreen());
    }
  }

  void previousPage() {
    if (currentStep > 0) {
      currentStep--;
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      Get.back();
    }
  }

  void selectGender(String gender) {
    selectedGender = gender;
    update();
  }

  void setCountry(String country) {
    selectedCountry = country;
    update();
  }

  void setCity(String city) {
    selectedCity = city;
    update();
  }

  void setLanguage(String lang) {
    selectedLanguage = lang;
    update();
  }

  void setProficiency(String proficiency) {
    selectedProficiency = proficiency;
    update();
  }

  void toggleInterest(String interest) {
    if (interest == 'Open for Everything') {
      selectedInterests = ['Open for Everything'];
    } else {
      selectedInterests.remove('Open for Everything');
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    }
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    nameController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
