import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/request_details_controller.dart';


class DeclineConfirmationDialog extends StatelessWidget {
  final String? name;
  final String? category;
  final String? dateTime;
  final VoidCallback? onDecline;

  const DeclineConfirmationDialog({
    super.key,
    this.name,
    this.category,
    this.dateTime,
    this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestDetailsController());

    if (name != null) controller.userName.value = name!;
    if (category != null) controller.categoryTitle.value = category!;
    if (dateTime != null) controller.dateTimeText.value = dateTime!;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 16.w, 24.h),
        decoration: BoxDecoration(
          color: const Color(0xFF162130),
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => controller.onCancel(),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 24.r,
                ),
              ),
            ),
            Text(
              'Request Decline Confirmation',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(
                    () => RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF98A5B3),
                      fontSize: 14.sp,
                      height: 1.45,
                    ),
                    children: [
                      const TextSpan(text: 'Please confirm you want to decline the request from '),
                      TextSpan(
                        text: controller.userName.value,
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' for '),
                      TextSpan(
                        text: controller.categoryTitle.value,
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' at '),
                      TextSpan(
                        text: '${controller.dateTimeText.value}.',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.onCancel(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF566373),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (onDecline != null) {
                        onDecline!();
                      } else {
                        controller.onDeclineConfirm();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF3B30),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Text(
                          'Yes, Decline',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}