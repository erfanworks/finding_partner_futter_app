import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildBottomNavigation({
  required String stepText,
  required VoidCallback onNext,
  required VoidCallback onSkip,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEDC286),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Text(
            stepText,
            style: GoogleFonts.dmSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color:  Color(0xFF1E2838),
            ),
          ),
        ),
      ),
      SizedBox(height: 12.h),
      GestureDetector(
        onTap: onSkip,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Skip for now",
              style: GoogleFonts.dmSans(
                color: Colors.white60,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.arrow_forward_ios, color: Colors.white60, size: 12.sp),
          ],
        ),
      ),
      SizedBox(height: 16.h),
    ],
  );
}