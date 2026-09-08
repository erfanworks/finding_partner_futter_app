import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/profile_set_up_controller.dart';
import '../widget/build_bottom_navigation.dart';
import '../widget/profile_setup_header.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSetUpController>(
      builder: (controller) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildSetupHeader(
                //   onBackPressed: () => controller.previousPage(),
                // ),
                Text(
                  "Select your interests",
                  style: GoogleFonts.dmSans(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Shown on your public profile.\nMatch with the right companion.",
                  style: GoogleFonts.dmSans(
                    fontSize: 16.sp,
                    color: Color(0xFFB2B2B7),
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 28.h),
                _buildSpecialInterestChip(
                  title: "Open for Everything",
                  imagePath: AppImages.worldIcon,
                  isSelected: controller.selectedInterests.contains("Open for Everything"),
                  onTap: () => controller.toggleInterest("Open for Everything"),
                ),
                SizedBox(height: 45.h),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                    mainAxisExtent: 48.h,
                  ),
                  itemCount: controller.interestOptions.length,
                  itemBuilder: (context, index) {
                    final item = controller.interestOptions[index];
                    final isSelected = controller.selectedInterests.contains(item['title']);

                    return _buildInterestChip(
                      title: item['title']!,
                      imagePath: item['icon']!,
                      isSelected: isSelected,
                      onTap: () => controller.toggleInterest(item['title']!),
                    );
                  },
                ),

                SizedBox(height: 28.h),

                _buildInterestChip(
                  title: "Social Talking",
                  imagePath: AppImages.messageImg,
                  isFullWidth: true,
                  isSelected:
                  controller.selectedInterests.contains("Social Talking"),
                  onTap: () => controller.toggleInterest("Social Talking"),
                ),

                const Spacer(),
                buildBottomNavigation(
                  stepText: "Step ${controller.currentStep + 1}/5",
                  onNext: () => controller.nextPage(),
                  onSkip: () => controller.nextPage(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget _buildInterestChip({
    required String title,
    String? icon,
    String? imagePath,
    required bool isSelected,
    required VoidCallback onTap,
    bool isFullWidth = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ?  const Color(0xFF283242) : const Color(0xFF1B2432),
          borderRadius: BorderRadius.circular(500.r),
          border: Border.all(
            color: isSelected ?  const Color(0xFFEDC286) : Colors.white10,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(imagePath, height: 22.sp, width: 22.sp)
            else if (icon != null)
              Text(icon, style: TextStyle(fontSize: 22.sp)),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.dmSans(
                  color: isSelected ? const Color(0xFFEDC286) : const Color(0xFFB2B2B7),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialInterestChip({
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 60.h,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 90.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1E293B)
                    : const Color(0xFF121927).withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFEDC286)
                      : Colors.white.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 28.w),
                  Text(
                    title,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -7,
              top: -10.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFA3D4F7).withValues(alpha: 0.5),
                          blurRadius: 19,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}