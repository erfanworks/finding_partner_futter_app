import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/route/app_routes.dart';
import '../controller/settings_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Change Password',
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
                          _buildInputLabel('CURRENT PASSWORD'),
                          SizedBox(height: 8.h),
                          _buildPasswordField(
                            controller: controller.currentPasswordController,
                            isObscure: controller.isObscureCurrent,
                            onToggle: () => controller.toggleObscureCurrent(),
                          ),
                          SizedBox(height: 20.h),
                          _buildInputLabel('NEW PASSWORD'),
                          SizedBox(height: 8.h),
                          _buildPasswordField(
                            controller: controller.newPasswordController,
                            isObscure: controller.isObscureNew,
                            onToggle: () => controller.toggleObscureNew(),
                          ),
                          SizedBox(height: 20.h),
                          _buildInputLabel('CONFIRM NEW PASSWORD'),
                          SizedBox(height: 8.h),
                          _buildPasswordField(
                            controller: controller.confirmPasswordController,
                            isObscure: controller.isObscureConfirm,
                            onToggle: () => controller.toggleObscureConfirm(),
                          ),
                          SizedBox(height: 28.h),
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                color: const Color(0xFFE2B46A),
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Create a secure password:',
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          _buildRequirementItem('At least 8 characters'),
                          _buildRequirementItem('Contains at least one number'),
                          _buildRequirementItem('Contains at least one uppercase letter'),
                          _buildRequirementItem('Contains at least one special character'),
                          SizedBox(height: 20.h),
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
                        onPressed:
                       () => Get.toNamed(AppRoutes.changePasswordScreen),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEDC286),
                          // disabledBackgroundColor: const Color(0xFFEDC286).withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.dmSans(
                            color: Colors.black,
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

  Widget _buildInputLabel(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: const Color(0xFF94A3B8),
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: const Color(0xFF3D4754), width: 1.5.w),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: '**********',
          hintStyle: GoogleFonts.dmSans(
            color: const Color(0xFFE6E6E8),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 10.w),
            child: Image.asset(
              AppImages.lockIcon,
              height: 20.sp,
              width: 20.sp,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: const Color(0xFFB2B2B7),
              size: 20.sp,
            ),
            onPressed: onToggle,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Text(
            '•  ',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFB2B2B7),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                color: const Color(0xFFB2B2B7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}