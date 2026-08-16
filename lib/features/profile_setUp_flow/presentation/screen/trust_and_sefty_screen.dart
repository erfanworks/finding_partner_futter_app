// import 'package:amychebbi/core/constants/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../controller/profile_set_up_controller.dart';
// import '../widget/build_bottom_navigation.dart';
// import '../widget/verification_alart.dart';
//
//
// class TrustAndSafetyScreen extends StatelessWidget {
//   const TrustAndSafetyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProfileSetUpController>(
//       builder: (controller) {
//         return SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       AppImages.trustSafetyIcon,
//                       height: 50.h,
//                       width: 50.w,
//                     ),
//                     SizedBox(width: 12.w),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Trust & Safety",
//                           style: GoogleFonts.dmSans(
//                             fontSize: 22.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "Every real interaction starts with real identity.",
//                           style: GoogleFonts.dmSans(
//                             fontSize: 14.sp,
//                             color: Color(0xFFE6E6E8),
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16.h),
//                 Image.asset(AppImages.italyText),
//                 SizedBox(height: 20.h),
//
//                 _buildVerificationCard(
//                   title: "Confirm your identity",
//                   ImagPath: AppImages.confirmIdentity,
//                   desc:
//                       "Have your government ID or passport ready. You'll also take a real-time photo or short video to confirm it's really you.",
//                   buttonText: "Verify Now",
//                   onTap: () {},
//                 ),
//                 SizedBox(height: 14.h),
//
//                 _buildVerificationCard(
//                   title: "Criminal Check (optional)",
//                   ImagPath: AppImages.criminalCheckIcon,
//                   desc:
//                       "Upload a clean criminal record certificate, not older than 6 months. Once verified, it's shown on your public profile.",
//                   buttonText: "Upload Now",
//                   onTap: () {},
//                 ),
//                 SizedBox(height: 16.h),
//
//                 Text(
//                   "Real connection needs real trust.\nWe've got your safety covered.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.dmSans(
//                     fontSize: 14.sp,
//                     color: Color(0xFFE6E6E8),
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 Container(
//                   padding: EdgeInsets.all(12.w),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0F2B22),
//                     borderRadius: BorderRadius.circular(12.r),
//                     border: Border.all(
//                       color: const Color(0xFF10B981).withValues(alpha: 0.3),
//                     ),
//                   ),
//                   child: Text(
//                     "Only verified users can book or offer companionship. Your data is encrypted and never shared.",
//                     style: GoogleFonts.dmSans(
//                       fontSize: 14.sp,
//                       color: Color(0xFF10B981),
//                       fontWeight: FontWeight.w500
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 buildBottomNavigation(
//                   stepText: "Step ${controller.currentStep + 1}/5",
//                   onNext: () => controller.nextPage(),
//                   onSkip: () => showVerificationAlert(context, controller),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildVerificationCard({
//     required String title,
//     required String desc,
//     required String buttonText,
//     required String ImagPath,
//     required VoidCallback onTap,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1B2432),
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Image.asset(ImagPath, height: 30.h, width: 30.w),
//               SizedBox(width: 10.w),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: GoogleFonts.dmSans(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16.sp,
//                       ),
//                     ),
//                     SizedBox(height: 6.h),
//                     Text(
//                       desc,
//                       style: GoogleFonts.dmSans(
//                         color: Color(0xFFB2B2B7),
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 14.h),
//           SizedBox(
//             width: double.infinity,
//             height: 50.h,
//             child: OutlinedButton(
//               onPressed: onTap,
//               style: OutlinedButton.styleFrom(
//                 side: BorderSide(color: Color(0xFFEDC286)),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(500.r),
//                 ),
//               ),
//               child: Text(
//                 buttonText,
//                 style: GoogleFonts.dmSans(
//                   color: Color(0xFFEDC286),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/profile_set_up_controller.dart';
import '../widget/build_bottom_navigation.dart';
import '../widget/verification_alart.dart';

class TrustAndSafetyScreen extends StatelessWidget {
  const TrustAndSafetyScreen({super.key});

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
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.trustSafetyIcon,
                                height: 50.h,
                                width: 50.w,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trust & Safety",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Every real interaction starts with real identity.",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14.sp,
                                        color: const Color(0xFFE6E6E8),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Image.asset(AppImages.italyText),
                          SizedBox(height: 20.h),

                          _buildVerificationCard(
                            title: "Confirm your identity",
                            ImagPath: AppImages.confirmIdentity,
                            desc:
                            "Have your government ID or passport ready. You'll also take a real-time photo or short video to confirm it's really you.",
                            buttonText: "Verify Now",
                            onTap: () {},
                          ),
                          SizedBox(height: 14.h),

                          _buildVerificationCard(
                            title: "Criminal Check (optional)",
                            ImagPath: AppImages.criminalCheckIcon,
                            desc:
                            "Upload a clean criminal record certificate, not older than 6 months. Once verified, it's shown on your public profile.",
                            buttonText: "Upload Now",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.h),

                          Text(
                            "Real connection needs real trust.\nWe've got your safety covered.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              fontSize: 14.sp,
                              color: const Color(0xFFE6E6E8),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F2B22),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: const Color(0xFF10B981).withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              "Only verified users can book or offer companionship. Your data is encrypted and never shared.",
                              style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                color: const Color(0xFF10B981),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const Spacer(),
                          SizedBox(height: 20.h),

                          buildBottomNavigation(
                            stepText: "Step ${controller.currentStep + 1}/5",
                            onNext: () => controller.nextPage(),
                            onSkip: () => showVerificationAlert(context, controller),
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

  Widget _buildVerificationCard({
    required String title,
    required String desc,
    required String buttonText,
    required String ImagPath,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2432),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImagPath, height: 30.h, width: 30.w),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      desc,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFB2B2B7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFEDC286)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500.r),
                ),
              ),
              child: Text(
                buttonText,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFEDC286),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}