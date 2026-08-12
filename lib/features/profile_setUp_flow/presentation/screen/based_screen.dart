import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/profile_set_up_controller.dart';
import '../widget/build_bottom_navigation.dart';
import '../widget/profile_setup_header.dart';

class BasedScreen extends StatelessWidget {
  const BasedScreen({super.key});

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
                buildSetupHeader(onBackPressed: () => controller.previousPage()),
                Text(
                  "Where are you based?",
                  style: GoogleFonts.dmSans(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Select the cities where you'd like to see companions and requests.",
                  style: GoogleFonts.dmSans(fontSize: 13.sp, color: Colors.white54),
                ),
                SizedBox(height: 24.h),

                Text("COUNTRY", style: _labelStyle()),
                SizedBox(height: 8.h),
                _dropdownBox("🌐", controller.selectedCountry, () {
                  // এখানে কান্ট্রি পিকার বা বটম শিট দিতে পারেন
                  controller.setCountry("Germany");
                }),

                SizedBox(height: 16.h),
                Text("CITY", style: _labelStyle()),
                SizedBox(height: 8.h),
                _dropdownBox("📍", controller.selectedCity, () {
                  controller.setCity("Berlin");
                }),

                SizedBox(height: 16.h),
                Text("LANGUAGE", style: _labelStyle()),
                SizedBox(height: 8.h),
                _languageSelector(controller),
                SizedBox(height: 20.h),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55.h),
                    backgroundColor: Color(0xFF1B2432),
                    side: BorderSide(color: Color(0xFF3D4754)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 6.w),
                      Text(
                        "Add Language",
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

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

  TextStyle _labelStyle() => GoogleFonts.dmSans(
    fontSize: 10.sp,
    color: Colors.white54,
    fontWeight: FontWeight.bold,
  );

  Widget _dropdownBox(String prefixEmoji, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1B2432),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Text(prefixEmoji, style: TextStyle(fontSize: 16.sp)),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(value, style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp)),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
          ],
        ),
      ),
    );
  }

  Widget _languageSelector(ProfileSetUpController controller) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2432),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("🗣️", style: TextStyle(fontSize: 16.sp)),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(controller.selectedLanguage, style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp)),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _radioButton("Native", controller.selectedProficiency == "Native", () => controller.setProficiency("Native")),
              SizedBox(width: 20.w),
              _radioButton("Fluent", controller.selectedProficiency == "Fluent", () => controller.setProficiency("Fluent")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? const Color(0xFFEDC286) : Colors.white38,
            size: 18.sp,
          ),
          SizedBox(width: 8.w),
          Text(title, style: GoogleFonts.dmSans(color: Colors.white70, fontSize: 13.sp)),
        ],
      ),
    );
  }
}