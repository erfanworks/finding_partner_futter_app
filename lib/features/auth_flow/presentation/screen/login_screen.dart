import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:amychebbi/features/auth_flow/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Stack(
            children: [
              Positioned(
                top: -30,
                child: Image.asset(
                  AppImages.gradient1,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.contain,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 80.h),
                      Image.asset(AppImages.logo, height: 100.h,width: 200.w),
                      SizedBox(height: 40.h),
                      Text(
                        "Sign In",
                        style: GoogleFonts.dmSans(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Great to see you again.",
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          color: Color(0xFFB2B2B7),
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 40.h),
                      _socialButton(
                        iconPath: AppImages.googleIcon,
                        text: "Continue with Google",
                        backgroundColor: const Color(0xFF1E293B),
                        textColor: Colors.white,
                        borderColor: Colors.white10,
                        onTap: () {},
                      ),
                      SizedBox(height: 10.h),
                      _socialButton(
                        iconData: Icons.apple,
                        text: "Continue with Apple",
                        backgroundColor: const Color(0xFFE6E6E8),
                        borderColor: Color(0xFF383945),
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
                                horizontal: 12.0),
                            child: Text(
                              "or sign in with",
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFB2B2B7),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      _customTextField(
                        controller: controller.emailController,
                        hintText: "Phone number or email address",
                        prefixIcon: Image.asset(
                            AppImages.phoneIcon, height: 20.h, width: 20.w),
                      ),
                      SizedBox(height: 16.h),
                      _customTextField(
                        controller: controller.passwordController,
                        hintText: "**********",
                        prefixIcon: Image.asset(
                          AppImages.lockIcon, height: 20.h, width: 20.w,),
                        isPassword: true,
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.forgotPasswordScreen);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFFEDC286),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.homescreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEDC286),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E2838),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: GoogleFonts.dmSans(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.signUpScreen);
                            },
                            child: Text(
                              "Sign Up",
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
        }
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
      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor:  Color(0xFF1E293B),
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(color: Color(0xFFB2B2B7), fontSize: 14.sp,fontWeight: FontWeight.w400),
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
        child: GestureDetector(
          onTap: onTap,
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
    );
    }
}
