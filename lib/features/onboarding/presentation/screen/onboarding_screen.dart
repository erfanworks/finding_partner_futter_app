import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/global_widget/common_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.onBoardingBackground,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Image.asset(
                    AppImages.logo,
                    height: 120.h,
                    width: 231.h,
                  ),
                  const Spacer(flex: 2),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.dmSans(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      children: [
                        const TextSpan(text: "Need someone "),
                        TextSpan(
                          text: "real\n",
                          style: TextStyle(
                            color: const Color(0xFFEDC286),
                            fontWeight: FontWeight.w700,
                            fontSize: 32.sp,
                          ),
                        ),
                        const TextSpan(text: "right now ?"),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Find your verified Companion,\nsharing your interests and showing up for you.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 16.sp,
                      color: Color(0xFFB2B2B7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(flex: 3),
                  CustomButton(
                    text: "Become a Member",
                    onTap: (){
                      Get.toNamed(AppRoutes.signUpScreen);
                      // Get.toNamed(AppRoutes.homescreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.logInScreen);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFFEDC286),
                          width: 1.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.r),
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEDC286),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}