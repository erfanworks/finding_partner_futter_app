import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/gift_bottom_sheet_controller.dart';


class GiftsBottomSheet extends StatelessWidget {
  const GiftsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiftsController());

    return Container(
      height: 0.88.sh,
      decoration: BoxDecoration(
        color: const Color(0xFF0F1A28),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [

          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xFF4A5568),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Text(
                'Gifts',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white70,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // ৩. কাস্টম সেগমেন্টেড ট্যাব বার (Frame, Badge, Gift)
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: const Color(0xFF152232),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: List.generate(controller.tabs.length, (index) {
                return Expanded(
                  child: Obx(() {
                    final isSelected = controller.selectedTab.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectTab(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                            colors: [Color(0xFFE6BA75), Color(0xFFB8853A)],
                          )
                              : null,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            controller.tabs[index],
                            style: GoogleFonts.dmSans(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF6A798A),
                              fontSize: 14.sp,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: GridView.builder(
              itemCount: controller.giftsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final item = controller.giftsList[index];
                return Obx(() {
                  final isSelected = controller.selectedGiftId.value == item.id;
                  return GestureDetector(
                    onTap: () => controller.selectGift(item.id),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF132030),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFE6BA75)
                              : Colors.white.withValues(alpha: 0.06),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.icon,
                            style: TextStyle(fontSize: 34.sp),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            item.name,
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCoinIcon(size: 14.r),
                              SizedBox(width: 4.w),
                              Text(
                                '${item.price}',
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
                });
              },
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF1D199), Color(0xFFD6A763)],
                ),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Text(
                  'Confirm',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF1E160D),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
  Widget _buildCoinIcon({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFC79549), Color(0xFF704A1F)],
        ),
      ),
      child: Center(
        child: Container(
          width: size * 0.8,
          height: size * 0.8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE8BA73), width: 0.6),
          ),
          child: Center(
            child: Text(
              '生',
              style: TextStyle(
                color: const Color(0xFFFBF1D9),
                fontSize: size * 0.45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}