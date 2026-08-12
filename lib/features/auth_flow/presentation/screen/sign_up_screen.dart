import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/auth_controller.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D131E),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Stack(
            children: [
              Positioned(
                top: -30,
                child: Image.asset(
                  AppImages.gradient1,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      Image.asset(AppImages.logo, height: 80.h),
                      SizedBox(height: 30.h),
                      Text(
                        "Become a Member",
                        style: GoogleFonts.dmSans(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Join a verified community.",
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          color: const Color(0xFFB2B2B7),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      _socialButton(
                        iconPath: AppImages.googleIcon,
                        text: "Continue with Google",
                        backgroundColor: const Color(0xFF1E2838),
                        textColor: Colors.white,
                        borderColor: Colors.white10,
                        onTap: () {

                        },
                      ),
                      SizedBox(height: 12.h),
                      _socialButton(
                        iconData: Icons.apple,
                        text: "Continue with Apple",
                        backgroundColor: const Color(0xFFE5E7EB),
                        textColor: Colors.black,
                        onTap: () {

                        },
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "or sign up with",
                              style: GoogleFonts.dmSans(
                                color: Colors.white54,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      _customTextField(
                        controller: controller.usernameController,
                        hintText: "Username",
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.white38,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white38,
                            size: 16.sp,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              "Your unique username is visible to everyone. Offensive or abusive usernames are not allowed and will result in a ban.",
                              style: GoogleFonts.dmSans(
                                color: Colors.white38,
                                fontSize: 11.sp,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _customTextField(
                        controller: controller.singUpEmailController,
                        hintText: "Phone number or email address",
                        prefixIcon: Image.asset(
                          AppImages.phoneIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _customTextField(
                        controller: controller.singUpPasswordController,
                        hintText: "•••••••••••",
                        prefixIcon: Image.asset(
                          AppImages.lockIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        isPassword: true,
                      ),
                      SizedBox(height: 28.h),
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.verificationScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEDC286),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E2838),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.dmSans(
                            color: Colors.white70,
                            fontSize: 12.sp,
                            height: 1.4,
                          ),
                          children: const [
                            TextSpan(text: "By continuing you agree to our "),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: " and\nhave read our "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.dmSans(
                              color: Colors.white70,
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFFEDC286),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required String hintText,
    required Widget prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2838),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(color: Colors.white38, fontSize: 14.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 18.sp, top: 15, bottom: 8, right: 6),
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

  Widget _socialButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
    String? iconPath,
    IconData? iconData,
    Color? borderColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
          ),
        ),
        child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: iconPath != null
                ? Image.asset(iconPath, height: 20.h)
                : iconData != null
                ? Icon(iconData, color: textColor, size: 22.sp)
                : const SizedBox.shrink(),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
    );
  }
}