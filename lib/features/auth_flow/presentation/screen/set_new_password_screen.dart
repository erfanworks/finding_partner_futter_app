import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/auth_controller.dart';



class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D131E),
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
                    "Set a New Password",
                    style: GoogleFonts.dmSans(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Subtitle
                  Text(
                    "Choose a new password to secure your account.",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      color: const Color(0xFFB2B2B7),
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // New Password Label & Field
                  Text(
                    "NEW PASSWORD",
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildPasswordField(
                    controller: controller.newPassController,
                    hintText: "••••••••••••",
                  ),

                  SizedBox(height: 20.h),

                  // Confirm New Password Label & Field
                  Text(
                    "CONFIRM NEW PASSWORD",
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildPasswordField(
                    controller: controller.newConfirmPassController,
                    hintText: "••••••••••••",
                  ),

                  SizedBox(height: 28.h),

                  // Secure Password Info Rules
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFFEDC286),
                        size: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Create a secure password:",
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Rules Bullet List
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint("At least 8 characters"),
                        SizedBox(height: 4.h),
                        _buildBulletPoint("Contains at least one number"),
                        SizedBox(height: 4.h),
                        _buildBulletPoint("Contains at least one uppercase letter"),
                        SizedBox(height: 4.h),
                        _buildBulletPoint("Contains at least one special character"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      onPressed: () {
                       Get.toNamed(AppRoutes.registrationSuccessScreen);
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

  // Password Input Field Box
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2838),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(
            color: Colors.white38,
            fontSize: 16.sp,
            letterSpacing: 2,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 18.w, right: 12.w),
            child: Icon(
              Icons.lock_outline,
              color: Colors.white38,
              size: 20.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 40.w),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ),
    );
  }

  // Bullet Point Item Builder
  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "•  ",
          style: TextStyle(
            color: const Color(0xFFB2B2B7),
            fontSize: 12.sp,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 13.sp,
              color: const Color(0xFFB2B2B7),
            ),
          ),
        ),
      ],
    );
  }
}