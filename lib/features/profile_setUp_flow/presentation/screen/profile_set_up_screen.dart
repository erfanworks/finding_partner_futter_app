import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                buildSetupHeader(
                  onBackPressed: () => controller.previousPage(),
                ),
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
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFF1B2432),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Tap to add a photo",
                        style: GoogleFonts.dmSans(
                          color: Colors.white54,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  "NAME",
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2432),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TextField(
                    controller: controller.nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white38,
                        fontSize: 13.sp,
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.white38,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  "BIO",
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    color: Colors.white54,
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
                      fontSize: 13.sp,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
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