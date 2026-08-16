import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';


class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Spacer(flex: 2),
              Image.asset(
                AppImages.logo,
                height: 100.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 48.h),
              Text(
                "Congratulations!",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Your registration has been successfully completed.",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB2B2B7),
                ),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.mainProfileSetupScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDC286),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.dmSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF383945),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}