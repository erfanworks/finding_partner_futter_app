import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              padding:  EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Image.asset(AppImages.logo, height: 90.h),
                 SizedBox(height: 40.h),
                  Text(
                    "Sign In",
                    style: GoogleFonts.dmSans(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Great to see you again.",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      color: Color(0xFFB2B2B7),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  _socialButton(
                    iconPath: AppImages.googleIcon,
                    text: "Continue with Google",
                    backgroundColor: const Color(0xFF1E2838),
                    textColor: Colors.white,
                    borderColor: Colors.white10,
                    onTap: () {},
                  ),
                   SizedBox(height: 10.h),
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
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "or sign in with",
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
                    controller: emailController,
                    hintText: "Phone number or email address",
                    prefixIcon: Image.asset(AppImages.phoneIcon,height: 20.h,width: 20.w),
                  ),
                  SizedBox(height: 16.h),
                  _customTextField(
                    controller: passwordController,
                    hintText: "•••••••••••",
                    prefixIcon: Image.asset(AppImages.lockIcon,height: 20.h,width: 20.w,),
                    isPassword: true,
                  ),
                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
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
            padding: EdgeInsets.only(left: 18.sp,top: 15,bottom: 8,right: 6),
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
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
        child: Row(
          children: [
            if (iconPath != null)
              Image.asset(iconPath, height: 20.h)
            else if (iconData != null)
              Icon(iconData, color: textColor, size: 22.sp),
            const SizedBox(width: 10),
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
