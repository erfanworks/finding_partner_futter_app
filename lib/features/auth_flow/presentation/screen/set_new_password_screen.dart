import 'package:amychebbi/core/constants/app_images.dart';
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
                      fontSize: 16.sp,
                      color:  Color(0xFFB2B2B7),
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // New Password Label & Field
                  Text(
                    "NEW PASSWORD",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildPasswordField(
                    controller: controller.newPassController,
                    hintText: "••••••••••••",
                    prefixIcon: Image.asset(AppImages.lockIcon,height: 30.h,width: 30.w,),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "CONFIRM NEW PASSWORD",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildPasswordField(
                    controller: controller.newConfirmPassController,
                    hintText: "••••••••••••",
                    prefixIcon: Image.asset(AppImages.lockIcon,height: 30.h,width: 30.w,),
                  ),
                  SizedBox(height: 28.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFFEDC286),
                        size: 28.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Create a secure password:",
                        style: GoogleFonts.dmSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
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
                        backgroundColor: Color(0xFFEDC286),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.r),
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


  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required Widget prefixIcon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor:  Color(0xFF1E293B),
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(color: Color(0xFFB2B2B7), fontSize: 14.sp),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h, right: 10.w),
          child: prefixIcon,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500.r),
          borderSide: BorderSide(
            color: Color(0xFF3D4754),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500.r),
          borderSide: BorderSide(
            color: Color(0xFFEDC286),
            width: 1.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500.r),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500.r),
          borderSide:  BorderSide(
            color: Color(0xFF3D4754),
            width: 1.w,
          ),
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
          style:GoogleFonts.inter(
            color: Color(0xFFB2B2B7),
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style:GoogleFonts.inter(
              color: Color(0xFFB2B2B7),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}