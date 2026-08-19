import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../nav_bar_flow/screen/nav_bar.dart';
import '../controller/explore_controller.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 3),
      body: SafeArea(
        child: GetBuilder<ExploreController>(
          init: ExploreController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: 12.h),
                SizedBox(
                  height: 42.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    separatorBuilder: (context, index) => SizedBox(width: 8.w),
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      // এখানে controller.selectedCategory এখন সাধারণ String
                      final isSelected = controller.selectedCategory == category;

                      return GestureDetector(
                        onTap: () => controller.selectCategory(category),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFE5BA73) : const Color(0xFF162232),
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: isSelected ? const Color(0xFFE5BA73) : Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: GoogleFonts.dmSans(
                                color: isSelected ? const Color(0xFF1E160D) : const Color(0xFF98A5B3),
                                fontSize: 14.sp,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.profiles.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final item = controller.profiles[index];
                      return Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: const Color(0xFF162232),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18.r),
                              child: Image.network(
                                item.image,
                                width: 100.w,
                                height: 110.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                item.name,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            Image.asset(
                                              AppImages.hexagramShapeIcon,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.toggleFavorite(index),
                                        child: Icon(
                                          item.isFavorite
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border_rounded,
                                          color: item.isFavorite ? Colors.red : const Color(0xFF8FA1B5),
                                          size: 20.r,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    '${item.category}  •  ${item.location}',
                                    style: GoogleFonts.dmSans(
                                      color: const Color(0xFF8FA1B5),
                                      fontSize: 11.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: const Color(0xFFE5BA73),
                                        size: 16.r,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        item.rating,
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xFFE5BA73),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        ' (${item.reviews})',
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xFF8FA1B5),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.price,
                                            style: GoogleFonts.dmSans(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'or ',
                                                style: GoogleFonts.dmSans(
                                                  color: const Color(0xFF8FA1B5),
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              Icon(
                                                Icons.generating_tokens_rounded,
                                                color: const Color(0xFFE5BA73),
                                                size: 12.r,
                                              ),
                                              SizedBox(width: 2.w),
                                              Text(
                                                item.coinText,
                                                style: GoogleFonts.dmSans(
                                                  color: const Color(0xFF8FA1B5),
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5BA73),
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            'Send Message',
                                            style: GoogleFonts.dmSans(
                                              color: const Color(0xFF1E160D),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}