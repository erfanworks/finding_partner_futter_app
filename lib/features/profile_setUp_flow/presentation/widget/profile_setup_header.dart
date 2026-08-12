import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSetupHeader({
  required VoidCallback onBackPressed,
  VoidCallback? onSkipPressed,
  bool showSkip = false,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
        ),
        if (showSkip)
          GestureDetector(
            onTap: onSkipPressed,
            child: Text(
              "Skip",
              style: GoogleFonts.dmSans(
                color: Colors.white70,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        else
          const SizedBox(width: 40),
      ],
    ),
  );
}