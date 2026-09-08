import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/profile_set_up_controller.dart';
import '../widget/build_bottom_navigation.dart';
import '../widget/profile_setup_header.dart';

class ProfileSetUpStep5View extends StatelessWidget {
  const ProfileSetUpStep5View({super.key});

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
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundColor: Colors.white10,
                            child: Icon(
                              Icons.person,
                              size: 60.sp,
                              color: Colors.white30,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration:  BoxDecoration(
                                color: Color(0xFF1B2432),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Tap to add a photo",
                        style: GoogleFonts.dmSans(
                          color: Color(0xFFB2B2B7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  "NAME",
                  style: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    color: Color(0xFFE6E6E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  // controller: ,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1E293B),
                    hintText: "Enter Name",
                    hintStyle: GoogleFonts.dmSans(
                      color: Color(0xFFB2B2B7),
                      fontSize: 16.sp,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 12.h,
                        bottom: 12.h,
                        right: 10.w,
                      ),
                      child: SvgPicture.asset(
                        AppImages.profileIcon,
                        height: 25.sp,
                        width: 25.sp,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFB2B2B7),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(500.r),
                      borderSide: BorderSide(
                        color: Color(0xFF3D4754),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(500.r),
                      borderSide: BorderSide(
                        color: Color(0xFF3D4754),
                        width: 1.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(500.r),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(500.r),
                      borderSide: BorderSide(
                        color: Color(0xFF3D4754),
                        width: 1.w,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  "BIO",
                  style: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    color: Color(0xFFE6E6E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2432),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextField(
                    controller: controller.bioController,
                    maxLines: 4,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
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
}
