import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showDeleteAccountDialog(BuildContext context, {required VoidCallback onLogout}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF16202E),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Account Delete',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFFF3B30),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Are you sure you want to delete your account?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Container(
                height: 1,
                color: const Color(0xFF243244),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          alignment: Alignment.center,
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFF94A3B8),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 1,
                      color: const Color(0xFF243244),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          onLogout();
                        },
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.r),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          alignment: Alignment.center,
                          child: Text(
                            'Yes, Delete',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFFFF3B30),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}