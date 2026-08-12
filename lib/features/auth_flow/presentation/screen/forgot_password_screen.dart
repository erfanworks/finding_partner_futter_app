import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/auth_controller.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D131E), // App dark background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  // Title
                  Text(
                    "Forgot Password",
                    style: GoogleFonts.dmSans(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Subtitle
                  Text(
                    "Choose your preferred contact method\nto receive a one-time verification code.",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      color: const Color(0xFFB2B2B7),
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // Input Label
                  Text(
                    "CONTACT METHOD",
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Custom Text Field
                  _customTextField(
                    controller: controller.emailController, // প্রয়োজনে আপনার টেক্সট কন্ট্রোলার পাস করুন
                    hintText: "Phone number or email address",
                    prefixIcon: Image.asset(
                      AppImages.phoneIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),

                  const Spacer(),

                  // Request OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.setNewPasswordScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDC286),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Request OTP",
                        style: GoogleFonts.dmSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E2838),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required String hintText,
    required Widget prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2838),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(color: Colors.white38, fontSize: 14.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 18.sp, top: 15, bottom: 15, right: 10),
            child: prefixIcon,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}