import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1522),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 18.sp,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Privacy policy',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFF3D4754), width: 1.w),
            ),
            child: Text(
              "Terms and conditions are a legal contract between a service provider and a user. They set the rules for using a website, app, or product, protect the business from legal liability, and explain what users can expect. They are also called terms of service or terms of use.",
              style: GoogleFonts.dmSans(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                height: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}