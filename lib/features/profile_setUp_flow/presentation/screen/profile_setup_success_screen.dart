import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetupSuccessScreen extends StatelessWidget {
  const ProfileSetupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C131D),
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
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "生",
                    style: GoogleFonts.notoSans(
                      fontSize: 48.sp,
                      color: const Color(0xFFEDC286),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "S E I R U",
                    style: GoogleFonts.dmSans(
                      fontSize: 18.sp,
                      color: Colors.white,
                      letterSpacing: 6,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "Welcome,\nzarif",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "To the safe place",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFFEDC286),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Where real people connect for:",
                    style: GoogleFonts.dmSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Travel, Business, Fitness, Gaming, Activities, Networking\nor simply someone to talk to.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      color: Color(0xFFB2B2B7),
                      fontWeight: FontWeight.w400
                    ),
                  ),

                  const Spacer(flex: 3),

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
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
                        "My Profile",
                        style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E2838),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFEDC286)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Explore Seiru",
                        style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
}