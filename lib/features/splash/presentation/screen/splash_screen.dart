import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.gradient, fit: BoxFit.cover),
          ),
          Center(
            child: Image.asset(AppImages.logo, width: 200),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.30,
            left: 0,
            right: 0,
            child: Text(
              "REAL PEOPLE.  REAL CONNECTIONS.",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 14.sp,
                color: Color(0xFFEDC286),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      )
    );
  }
}