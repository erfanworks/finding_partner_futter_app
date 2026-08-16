// import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/trust_and_sefty_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/profile_set_up_controller.dart';
// import '../widget/profile_setup_header.dart';
// import '../widget/verification_alart.dart';
// import 'gender_screen.dart';
// import 'based_screen.dart';
// import 'interests_screen.dart';
// import 'profile_set_up_screen.dart';
//
// class MainProfileSetupScreen extends StatelessWidget {
//   const MainProfileSetupScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileSetUpController());
//     return Scaffold(
//       appBar: ProfileSetupAppBar(
//         onBackPressed: () => controller.previousPage(),
//         showSkip: controller.currentStep == 3,
//         onSkipPressed: () {
//           if (controller.currentStep == 3) {
//             showVerificationAlert(context, controller);
//           } else {
//             controller.nextPage();
//           }
//         },
//       ),
//       body: PageView(
//         controller: controller.pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         onPageChanged: (index) => controller.setStep(index),
//         children: [
//           GenderScreen(),
//           BasedScreen(),
//           InterestsScreen(),
//           TrustAndSafetyScreen(),
//           ProfileSetUpStep5View(),
//         ],
//       ),
//     );
//   }
// }

import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/profile_set_up_screen.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/trust_and_sefty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_set_up_controller.dart';
import '../widget/profile_setup_header.dart';
import '../widget/verification_alart.dart';
import 'based_screen.dart';
import 'gender_screen.dart';
import 'interests_screen.dart';

class ProfileSetupMainScreen extends StatelessWidget {
  const ProfileSetupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSetUpController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF0C131D),
          appBar: ProfileSetupAppBar(
            onBackPressed: () => controller.previousPage(),
            showSkip: controller.currentStep == 3,
            onSkipPressed: () {
              if (controller.currentStep == 3) {
                showVerificationAlert(context, controller);
              } else {
                controller.nextPage();
              }
            },
          ),

          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => controller.setStep(index),
            children: [
              GenderScreen(),
              BasedScreen(),
              InterestsScreen(),
              TrustAndSafetyScreen(),
              ProfileSetUpStep5View(),
            ],
          ),
        );
      },
    );
  }
}
