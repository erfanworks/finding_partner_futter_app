// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../controller/profile_set_up_controller.dart';
// import '../widget/build_bottom_navigation.dart';
//
//
// class GenderScreen extends StatelessWidget {
//   const GenderScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProfileSetUpController>(
//       builder: (controller) {
//         return SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "What's your gender?",
//                   style: GoogleFonts.dmSans(
//                     fontSize: 24.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 6.h),
//                 Text(
//                   "We use this to personalize your security experience and profile data.",
//                   style: GoogleFonts.dmSans(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFFB2B2B7),
//                   ),
//                 ),
//                 SizedBox(height: 20.h),
//
//                 _genderTile("Male", "👨‍💼", controller),
//                 SizedBox(height: 14.h),
//                 _genderTile("Female", "👩‍💼", controller),
//                 SizedBox(height: 14.h),
//                 _genderTile("Non-binary", "🧑‍🎤", controller),
//
//                 SizedBox(height: 24.h),
//                 Text(
//                   "What's your date of birth?",
//                   style: GoogleFonts.dmSans(
//                     fontSize: 22.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//
//                 Row(
//                   children: [
//                     _dobBox("DAY", "DD", controller.dayController),
//                     SizedBox(width: 10.w),
//                     _dobBox("MONTH", "MM", controller.monthController),
//                     SizedBox(width: 10.w),
//                     _dobBox("YEAR", "YYYY", controller.yearController),
//                   ],
//                 ),
//                 SizedBox(height: 18.h),
//
//                 Container(
//                   padding: EdgeInsets.all(12.w),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFEDC286).withValues(alpha: 0.2),
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.shield_outlined,
//                         color: Color(0xFFEDC286),
//                         size: 30.sp,
//                       ),
//                       SizedBox(width: 10.w),
//                       Expanded(
//                         child: Text(
//                           "Only your age is shown, never your exact birthday. Age verification may include an ID check to confirm accuracy.",
//                           style: GoogleFonts.dmSans(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const Spacer(),
//                 buildBottomNavigation(
//                   stepText: "Step ${controller.currentStep + 1}/5",
//                   onNext: () => controller.nextPage(),
//                   onSkip: () => controller.nextPage(),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _genderTile(String title, String emoji, ProfileSetUpController controller) {
//     bool isSelected = controller.selectedGender == title;
//     return GestureDetector(
//       onTap: () => controller.selectGender(title),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//         decoration: BoxDecoration(
//           color: isSelected ?Color(0xFFEDC286).withValues(alpha: 0.1): Color(0xFF283242),
//           borderRadius: BorderRadius.circular(24.r),
//           border: Border.all(
//             color: isSelected ? Color(0xFFEDC286) : Colors.transparent,
//             width: 1.5,
//           ),
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 18.r,
//               backgroundColor: Color(0xFFEDC286),
//               child: Text(emoji, style: TextStyle(fontSize: 16.sp)),
//             ),
//             SizedBox(width: 14.w),
//             Text(
//               title,
//               style: GoogleFonts.dmSans(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Color(0xFFEDC286) : Color(0xFFE6E6E8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _dobBox(String label, String hint, TextEditingController controller) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: GoogleFonts.dmSans(
//               fontSize: 10.sp,
//               color: Colors.white54,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8.h),
//           Container(
//             height: 60.h,
//             decoration: BoxDecoration(
//               color: Color(0xFF1E293B),
//               borderRadius: BorderRadius.circular(12.r),
//               border: Border.all(width: 1.w,color: Color(0xFF3D4754))
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: Center(
//                 child: TextField(
//                   controller: controller,
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: hint,
//                     hintStyle: GoogleFonts.dmSans(
//                       color: Colors.white38,
//                       fontSize: 13.sp,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/profile_set_up_controller.dart';
import '../widget/build_bottom_navigation.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSetUpController>(
      builder: (controller) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What's your gender?",
                            style: GoogleFonts.dmSans(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "We use this to personalize your security experience and profile data.",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFB2B2B7),
                            ),
                          ),
                          SizedBox(height: 20.h),

                          _genderTile("Male", AppImages.maleImg, controller),
                          SizedBox(height: 14.h),
                          _genderTile("Female", AppImages.femaleImg, controller),
                          SizedBox(height: 14.h),
                          _genderTile("Non-binary", AppImages.nonBinaryImg, controller),

                          SizedBox(height: 24.h),
                          Text(
                            "What's your date of birth?",
                            style: GoogleFonts.dmSans(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              _dobBox("DAY", "DD", controller.dayController),
                              SizedBox(width: 10.w),
                              _dobBox("MONTH", "MM", controller.monthController),
                              SizedBox(width: 10.w),
                              _dobBox("YEAR", "YYYY", controller.yearController),
                            ],
                          ),
                          SizedBox(height: 18.h),

                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDC286).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImages.shieldWithIcon,
                                  height: 30.sp,
                                  width: 30.sp,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Text(
                                    "Only your age is shown, never your exact birthday. Age verification may include an ID check to confirm accuracy.",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Spacer()-এর বদলে Spacer-এর মতো কাজ করবে IntrinsicHeight + Spacer
                          const Spacer(),
                          SizedBox(height: 20.h),

                          buildBottomNavigation(
                            stepText: "Step ${controller.currentStep + 1}/5",
                            onNext: () => controller.nextPage(),
                            onSkip: () => controller.nextPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _genderTile(String title, String imagePath, ProfileSetUpController controller) {
    bool isSelected = controller.selectedGender == title;
    return GestureDetector(
      onTap: () => controller.selectGender(title),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEDC286).withValues(alpha: 0.1)
              : const Color(0xFF283242),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFEDC286) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: const Color(0xFFEDC286),
              child: ClipOval(
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Text(
              title,
              style: GoogleFonts.dmSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xFFEDC286) : const Color(0xFFE6E6E8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dobBox(String label, String hint, TextEditingController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1.w, color: const Color(0xFF3D4754)),
            ),
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: GoogleFonts.dmSans(
                      color: Colors.white38,
                      fontSize: 13.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}