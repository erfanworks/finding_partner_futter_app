import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/shop_gift_controller.dart';


class ShopGiftsScreen extends StatelessWidget {
  const ShopGiftsScreen({super.key});

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
          'Gifts',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Top Right Golden Coin Badge
          GetBuilder<ShopGiftsController>(
            init: ShopGiftsController(),
            builder: (controller) => Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFF151F30),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFFE5B069).withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: const Color(0xFFE5B069),
                    child: Text('生', style: TextStyle(fontSize: 10.sp, color: Colors.black)),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    controller.coinCount,
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFFE5B069),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<ShopGiftsController>(
        builder: (controller) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: controller.giftList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, index) {
              final gift = controller.giftList[index];
              return _buildGiftCard(gift, () => controller.selectGift(gift));
            },
          );
        },
      ),
    );
  }

  // Single Gift Item Card Component
  Widget _buildGiftCard(GiftItem gift, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF151F30),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rose Icon Placeholder (Replace with Image.asset if needed)
            Icon(
              Icons.local_florist_rounded,
              color: const Color(0xFFFF4B6E),
              size: 34.r,
            ),
            SizedBox(height: 10.h),

            // Item Name
            Text(
              gift.name,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6.h),

            // Condition: "Owned" Badge OR Coin Price Tag
            if (gift.isOwned)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D4B3E),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.5)),
                ),
                child: Text(
                  'Owned',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF22C55E),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 6.r,
                    backgroundColor: const Color(0xFFE5B069),
                    child: Text('生', style: TextStyle(fontSize: 6.sp, color: Colors.black)),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    gift.price,
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF8C9BAE),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}