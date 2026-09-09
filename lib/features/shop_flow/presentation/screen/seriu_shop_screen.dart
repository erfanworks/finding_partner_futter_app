import 'package:amychebbi/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/seriu_shop_controller.dart';


class SeiroShopScreen extends StatelessWidget {
  const SeiroShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       surfaceTintColor: AppColors.appBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Seiro Shop',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          GetBuilder<SeiroShopController>(
            init: SeiroShopController(),
            builder: (controller) => Center(
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
                        controller.totalCoins,
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
        ],
      ),
      body: GetBuilder<SeiroShopController>(
        init: SeiroShopController(),
        builder: (controller) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: controller.shopItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              final pack = controller.shopItems[index];
              return _buildShopCard(pack, controller);
            },
          );
        },
      ),
    );
  }

  Widget _buildShopCard(SeiroPackModel pack, SeiroShopController controller) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 14.h,
            child: Text(
              pack.title,
              style: GoogleFonts.dmSans(
                color: const Color(0xFFEDC286),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned.fill(
            top: 36.h,
            bottom: 48.h,
            child: Image.asset(
              AppImages.seiruCoin,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 16.w,
            right: 16.w,
            child: InkWell(
              onTap: () => controller.onBuyPack(pack),
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                height: 38.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF222B3D),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFFE5B069).withValues(alpha: 0.6),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 4.r,
                      height: 4.r,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5B069),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      pack.price,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFE5B069),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}