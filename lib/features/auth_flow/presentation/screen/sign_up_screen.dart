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
                  padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      Image.asset(AppImages.logo, height: 100.h, width: 200.w),
                      SizedBox(height: 30.h),
                      Text(
                        "Become a Member",
                        style: GoogleFonts.dmSans(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Join a verified community.",
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          color: Color(0xFFB2B2B7),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      _socialButton(
                        iconPath: AppImages.googleIcon,
                        text: "Continue with Google",
                        backgroundColor: const Color(0xFF1E2838),
                        textColor: Colors.white,
                        borderColor: Colors.white10,
                        onTap: () {},
                      ),
                      SizedBox(height: 12.h),
                      _socialButton(
                        iconData: Icons.apple,
                        text: "Continue with Apple",
                        backgroundColor: const Color(0xFFE5E7EB),
                        textColor: Colors.black,
                        onTap: () {},
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              "or sign up with",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFB2B2B7),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500
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
                        prefixIcon: Image.asset(AppImages.userNameIcon,height: 20.h,width: 20.w),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Color(0xFFEDC286),
                            size: 24.sp,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              "Your unique username is visible to everyone. Offensive or abusive usernames are not allowed and will result in a ban.",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFE6E6E8),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
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
                            backgroundColor: Color(0xFFEDC286),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(500.r),
                            ),
                          ),
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF383945),
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
                          children: [
                            TextSpan(
                              text: "By continuing you agree to our ",
                              style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFE6E6E8),
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFEDC286),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: " and\nhave read our ",
                              style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFE6E6E8),
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFEDC286),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
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
                              color: Color(0xFFFFFFFF),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.logInScreen);
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFEDC286),
                                fontWeight: FontWeight.w600,
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
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF1E2838),
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(
          color: Color(0xFFB2B2B7),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 5.w),
          child: prefixIcon,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colors.white10, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colors.white10, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFFEDC286), width: 1.2.w),
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
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(500.r),
        border: borderColor != null
            ? Border.all(color: borderColor, width: 1.w)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(500.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: iconPath != null
                      ? Image.asset(iconPath, height: 30.h)
                      : iconData != null
                      ? Icon(iconData, color: textColor, size: 33.sp)
                      : const SizedBox.shrink(),
                ),
                Text(
                  text,
                  style: GoogleFonts.dmSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
