
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/route/app_routes.dart';
import '../controller/settings_controller.dart';
import '../widget/show_delte_account_dialog.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom Pin Theme for OTP Input Box
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 58.h,
      textStyle: GoogleFonts.dmSans(
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF131F30),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF1D2E45), width: 1.5.w),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: const Color(0xFFE2B46A), width: 1.5.w),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0B1522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1522),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18.sp),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Delete Account',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          Text(
                            'This action will delete your all plans and permanently erase your all data. You cannot undo this action.',
                            style: GoogleFonts.dmSans(
                              color: Color(0xFFB2B2B7),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 16.h),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.dmSans(
                                  color: Color(0xFFB2B2B7),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400
                              ),
                              children: [
                                TextSpan(
                                  text: 'If you are sure you want to proceed, ',
                                ),
                                TextSpan(
                                  text:
                                  'Enter the 6-digit code sent to your registered email (ha***12@gmail.com)',
                                  style: GoogleFonts.dmSans(
                                    color: Color(0xFFE6E6E8),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Text(
                            'ENTER OTP',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFF94A3B8),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Center(
                            child: Pinput(
                              length: 6,
                              controller: controller.otpController,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              obscureText: true,
                              obscuringWidget: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              separatorBuilder: (index) => SizedBox(width: 18.w),
                              onCompleted: (pin) {

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h, top: 10.h),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: (){
                          showDeleteAccountDialog(
                            Get.context!,
                            onLogout: () {
                              Get.offAllNamed(AppRoutes.signUpScreen);
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8C28A),
                          disabledBackgroundColor: const Color(0xFFE8C28A).withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          elevation: 0,
                        ),
                        child: controller.isDeleteLoading
                            ? SizedBox(
                          height: 22.h,
                          width: 22.h,
                          child: const CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2.5,
                          ),
                        )
                            : Text(
                          'Delete Account',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF1E293B),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}