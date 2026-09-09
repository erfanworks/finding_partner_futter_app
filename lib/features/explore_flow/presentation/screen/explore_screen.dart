import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
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
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 1),
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
                                color: isSelected ? Colors.white : const Color(0xFF98A5B3),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
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
                          color: const Color(0xFF101C2B),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.network(
                                item.image,
                                width: 111.w,
                                height: 109.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                item.name,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 4.w),
                                            Image.asset(
                                              AppImages.starCompenionImg,
                                              height: 16,
                                              width: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.toggleFavorite(index),
                                        child: Container(
                                          padding: EdgeInsets.all(6.r),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white.withValues(alpha: 0.1),
                                              width: 1,
                                            ),
                                          ),
                                          child: Icon(
                                            item.isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: item.isFavorite ? Colors.redAccent : const Color(0xFF8A95A5),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    '${item.category}  •  ${item.location}',
                                    style: GoogleFonts.dmSans(
                                      color: const Color(0xFF8A95A5),
                                      fontSize: 12.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 6.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFB85701),
                                        size: 16,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        item.rating,
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xFFDA7113),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        ' (${item.reviews})',
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xFF8A95A5),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
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
                                              color: const Color(0xFFEDC286),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'or ',
                                                style: GoogleFonts.dmSans(
                                                  color: const Color(0xFF8A95A5),
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              Image.asset(
                                                AppImages.japansCoin,
                                                height: 11,
                                                width: 11,
                                              ),
                                              SizedBox(width: 2.w),
                                              Text(
                                                item.coinText,
                                                style: GoogleFonts.dmSans(
                                                  color: const Color(0xFF8A95A5),
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.toNamed(AppRoutes.messageListScreen),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFFECC27D),
                                                Color(0xFFBD8E48),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius: BorderRadius.circular(16.r),
                                          ),
                                          child: Text(
                                            'Send Message',
                                            style: GoogleFonts.dmSans(
                                              color: const Color(0xFF1A120B),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
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