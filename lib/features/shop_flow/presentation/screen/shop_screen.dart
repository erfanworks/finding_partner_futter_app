import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../../../nav_bar_flow/screen/nav_bar.dart';
import '../controller/shop_controller.dart';


class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A111E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Shop',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GetBuilder<ShopController>(
            init: ShopController(),
            builder: (controller) => Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.seiWalletScreen);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282D33),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: const Color(0xFFEDC286), width: 1.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.japansCoin,
                        height: 34.h,
                        width: 32.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 12.w),
                        child: Text(
                          controller.coinCount,
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFFEDC286),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
      body: GetBuilder<ShopController>(
        init: ShopController(),
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            children: [
              // _buildWeeklyDropBanner(),
              // SizedBox(height: 20.h),
              Row(
                children: [
                  _buildCategoryCard(
                    iconPath: AppImages.framesIcon,
                    onTap: () {
                      Get.toNamed(AppRoutes.avatarFramesScreen);
                    },
                    title: 'Frames',
                  ),
                  SizedBox(width: 12.w),
                  _buildCategoryCard(
                    title: 'Badges',
                    iconPath: AppImages.badgeIcon,
                    onTap: () {},
                  ),
                  SizedBox(width: 12.w),
                  _buildCategoryCard(
                    title: 'Gifts',
                    iconPath: AppImages.giftIcon,
                    onTap: () {
                      Get.toNamed(AppRoutes.shopGiftScreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFFE5B069),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: const Color(0xFFE5B069),
                          size: 12.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 14.h,
                  childAspectRatio: 0.78,
                ),
                itemCount: controller.trendingItems.length,
                itemBuilder: (context, index) {
                  final item = controller.trendingItems[index];
                  return _buildTrendingItemCard(item);
                },
              ),
            ],
          );
        },
      ),
    );
  }


  // Widget _buildWeeklyDropBanner() {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(20.r),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20.r),
  //       gradient: const LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: [
  //           Color(0xFFCE9D55),
  //           Color(0xFFA6783B),
  //         ],
  //       ),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'WEEKLY DROP',
  //           style: GoogleFonts.dmSans(
  //             color: Colors.white.withValues(alpha: 0.7),
  //             fontSize: 10.sp,
  //             fontWeight: FontWeight.w600,
  //             letterSpacing: 1.0,
  //           ),
  //         ),
  //         SizedBox(height: 6.h),
  //         Text(
  //           'Aurora Nebula Bundle',
  //           style: GoogleFonts.dmSans(
  //             color: const Color(0xFF1E160D),
  //             fontSize: 20.sp,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 2.h),
  //         Text(
  //           'Frames + Badges + Gifts',
  //           style: GoogleFonts.dmSans(
  //             color: const Color(0xFF2C2216).withValues(alpha: 0.8),
  //             fontSize: 12.sp,
  //           ),
  //         ),
  //         SizedBox(height: 16.h),
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
  //           decoration: BoxDecoration(
  //             color: const Color(0xFF162335),
  //             borderRadius: BorderRadius.circular(20.r),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Icon(Icons.monetization_on, color: const Color(0xFFE5B069), size: 16.r),
  //               SizedBox(width: 6.w),
  //               Text(
  //                 '1800',
  //                 style: GoogleFonts.dmSans(
  //                   color: Colors.white,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 6.w),
  //                 child: Text(
  //                   '•',
  //                   style: TextStyle(color: Colors.white70, fontSize: 10.sp),
  //                 ),
  //               ),
  //               Text(
  //                 'Save 25%',
  //                 style: GoogleFonts.dmSans(
  //                   color: Colors.white,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCategoryCard({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE5B069),
                Color(0xFFB57D3E),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(Color(0xFF2E2213), BlendMode.srcIn),
                height: 30.r,
                width: 30.r,
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF2E2213),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingItemCard(ShopItem item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1625),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: Container(
                  width: 38.r,
                  height: 38.r,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B4513),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE5B069), width: 2.r),
                  ),
                  child: Icon(
                    item.iconType == 'star'
                        ? Icons.star_rounded
                        : Icons.verified_rounded,
                    color: const Color(0xFFE5B069),
                    size: 20.r,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.monetization_on, color: const Color(0xFFE5B069), size: 12.r),
                    SizedBox(width: 4.w),
                    Text(
                      '${item.price}',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFEDC286),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400
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
  }
}