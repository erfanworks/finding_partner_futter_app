import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/trust_and_sefty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_set_up_controller.dart';
import 'gender_screen.dart';
import 'based_screen.dart';
import 'interests_screen.dart';

import 'profile_set_up_screen.dart';

class MainProfileSetupScreen extends StatelessWidget {
  const MainProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileSetUpController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => controller.setStep(index),
        children: const [
          GenderScreen(),
          BasedScreen(),
          InterestsScreen(),
          TrustAndSeftyScreen(),
          ProfileSetUpStep5View(),
        ],
      ),
    );
  }
}