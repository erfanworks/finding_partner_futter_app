import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../controller/auth_controller.dart';

class ForgetPasswordVerifyScreen extends StatelessWidget {
  const ForgetPasswordVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 58.h,
      textStyle: GoogleFonts.dmSans(
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2838),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.white10),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: GoogleFonts.dmSans(
        fontSize: 22.sp,
        color: const Color(0xFF1E2838),
        fontWeight: FontWeight.bold,
      ),
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color(0xFFEDC286),
        border: Border.all(color: const Color(0xFFEDC286)),
      ),
    );
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
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Verification",
                    style: GoogleFonts.dmSans(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFDFDFD),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFB2B2B7),
                      ),
                      children: [
                        const TextSpan(
                          text: "Enter the code we've sent to ",
                        ),
                        TextSpan(
                          text: "example.email@gmail.com",
                          style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Text(
                    "ENTER OTP",
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFE6E6E8),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Center(
                    child: Pinput(
                      length: 6,
                      obscureText: true,
                      obscuringWidget: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: const Color(0xFFEDC286)),
                        ),
                      ),
                      submittedPinTheme: submittedPinTheme,
                      separatorBuilder: (index) => SizedBox(width: 20.w),
                      showCursor: true,
                      onCompleted: (pin) {

                      },
                    ),
                  ),
                  SizedBox(height: 60.h),

                  Row(
                    children: [
                      Text(
                        "Resend code in ",
                        style: GoogleFonts.dmSans(
                            color: Color(0xFFE9E9E9),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "00: 15",
                        style: GoogleFonts.dmSans(
                          color: Color(0xFFE9E9E9),
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      "Choose an alternative verification method",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFEDC286),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // showIncorrectOtpBottomSheet(context);
                        Get.toNamed(AppRoutes.setNewPasswordScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDC286),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Verify",
                        style: GoogleFonts.dmSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E2838),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


void showIncorrectOtpBottomSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF141C2B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 55.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 24.h),
            decoration: BoxDecoration(
              color: Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFEF4444),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Incorrect code entered",
            style: GoogleFonts.dmSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Please check the OTP code and try again",
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              color: const Color(0xFFB2B2B7),
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDC286),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                "Got it",
                style: GoogleFonts.dmSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E2838),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}