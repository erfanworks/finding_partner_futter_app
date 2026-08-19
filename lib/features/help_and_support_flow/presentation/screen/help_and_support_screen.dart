import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/help_and_support_controller.dart';


class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpSupportController controller = Get.put(HelpSupportController());

    return Scaffold(
      backgroundColor: const Color(0xFF0B1522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1522),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Help & Support',
          style: GoogleFonts.sansita(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              // Description Text
              Text(
                "If you are experiencing any issue, please let us know. we’ll try to solve ythis issue as soon as possible",
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 24.h),

              // Subject Title Label
              Text(
                'SUBJECT TITLE',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFCBD5E1),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),

              SizedBox(height: 8.h),

              // Subject Input Field with Lock Icon
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF131F30),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: const Color(0xFF1D2E45), width: 1),
                ),
                child: TextField(
                  controller: controller.subjectController,
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: '**********',
                    hintStyle: GoogleFonts.dmSans(
                      color: const Color(0xFF64748B),
                      fontSize: 14.sp,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 10.w),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        color: const Color(0xFF94A3B8),
                        size: 20.sp,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Description Label
              Text(
                'Description',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 8.h),

              // Large Description Input Area
              Container(
                height: 180.h,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF131F30),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFF475569), width: 1),
                ),
                child: TextField(
                  controller: controller.descriptionController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: 'Write here',
                    hintStyle: GoogleFonts.dmSans(
                      color: const Color(0xFF64748B),
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              const Spacer(),

              // Bottom Submit Button
              Obx(() => SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.submitTicket(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE2B46A),
                    disabledBackgroundColor: const Color(0xFFE2B46A).withOpacity(0.6),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? SizedBox(
                    height: 22.h,
                    width: 22.h,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2.5,
                    ),
                  )
                      : Text(
                    'Submit',
                    style: GoogleFonts.dmSans(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}