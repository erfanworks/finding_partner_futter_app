import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/send_seiru_controller.dart';


class SendSeirusBottomSheet extends StatelessWidget {
  const SendSeirusBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SendSeirusController());

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFF4A5568),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Text(
                'Send Seirus',
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
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: const Color(0xFF0B121C),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR BALANCE',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        _buildCoinIcon(size: 20.r),
                        SizedBox(width: 8.w),
                        Obx(
                              () => Text(
                            '${_formatNumber(controller.balance.value)} Seirus',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFFEDC286),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF1D199), Color(0xFFD6A763)],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Get Seirus',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF1E160D),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'SELECT AMOUNT',
            style: GoogleFonts.dmSans(
              color: Color(0xFFB2B2B7),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 12.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.amounts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) {
              final amount = controller.amounts[index];
              final isPopular = amount == 100;

              return Obx(() {
                final isSelected = controller.selectedAmount.value == amount;

                return GestureDetector(
                  onTap: () => controller.selectAmount(amount),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF383D46)
                              : const Color(0xFF0B131F),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFF1D199)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildCoinIcon(size: 20.r),
                            SizedBox(height: 6.h),
                            Text(
                              '$amount',
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isPopular)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1D199),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(14.r),
                                bottomLeft: Radius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              'Popular',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFF1E160D),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              });
            },
          ),
          SizedBox(height: 20.h),
          Text(
            'CUSTOM AMOUNT',
            style: GoogleFonts.dmSans(
              color: Color(0xFFB2B2B7),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 52.h,
            decoration: BoxDecoration(
              color: const Color(0xFF0B131F),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.customAmountController,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        controller.selectedAmount.value = 0;
                      }
                    },
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter amount',
                      hintStyle: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                Text(
                  'Seirus',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFEDC286),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: Color(0xFFEDC286),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Text(
                  'Confirm',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF383945),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
  Widget _buildCoinIcon({required double size}) {
    return Image.asset(
      AppImages.japansCoin,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }


  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
    );
  }
}