import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09121D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Search',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: Color(0xFFB2B2B7),
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                  decoration: InputDecoration(
                    hintText: 'Miami',
                    hintStyle: GoogleFonts.dmSans(
                      color: Color(0xFFE6E6E8),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset(
                        AppImages.searchIcon,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF8C8D94),
                          BlendMode.srcIn,
                        ),
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                width: 48.h,
                height: 48.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF162232),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.filter_list_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}