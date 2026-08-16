// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../controller/profile_set_up_controller.dart';
//
// void _showVerificationAlert(
//     BuildContext context,
//     ProfileSetUpController controller,
//     ) {
//   Get.dialog(
//     Dialog(
//       backgroundColor: const Color(0xFF1B2432),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(20.w),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () => Get.back(),
//                 child: const Icon(Icons.close, color: Colors.white54),
//               ),
//             ),
//             Text(
//               "Verification Alert!",
//               style: GoogleFonts.dmSans(
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.redAccent,
//               ),
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               "If you skip this step, you can explore Seiru but won't be able to book, message, or interact with other companions until you're verified.",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.dmSans(
//                 fontSize: 14.sp,
//                 color: Colors.white70,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 24.h),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => Get.back(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white24,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                     ),
//                     child: Text(
//                       "Cancel",
//                       style: GoogleFonts.dmSans(
//                         color: Color(0xFFFDF9F3),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Get.back();
//                       controller.nextPage();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFEDC286),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                     ),
//                     child: Text(
//                       "Skip Now",
//                       style: GoogleFonts.dmSans(
//                         color: Color(0xFF383945),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/profile_set_up_controller.dart';

void showVerificationAlert(
    BuildContext context,
    ProfileSetUpController controller,
    ) {
  Get.dialog(
    Dialog(
      backgroundColor: const Color(0xFF1B2432),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.close, color: Colors.white54),
              ),
            ),
            Text(
              "Verification Alert!",
              style: GoogleFonts.dmSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "If you skip this step, you can explore Seiru but won't be able to book, message, or interact with other companions until you're verified.",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 14.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white24,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFFDF9F3),
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller.nextPage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEDC286),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      "Skip Now",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF383945),
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}