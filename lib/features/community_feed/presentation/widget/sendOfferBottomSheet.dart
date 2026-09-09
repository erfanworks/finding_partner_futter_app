import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/send_offer_bottom_sheet_controller.dart';

class SendOfferBottomSheet extends StatelessWidget {
  const SendOfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SendOfferController());

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF162130),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: SingleChildScrollView(
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
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Offer',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop',
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jamie L, 27',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Looking for a fitness partner for morning run in Central Park. Pace 5:30/km.',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF8C8D94),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'SET YOUR RATE',
              style: GoogleFonts.dmSans(
                color: const Color(0xFFE6E6E8),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Obx(
                  () => Row(
                children: [
                  _buildRadioButton(
                    label: 'Hourly',
                    isSelected: controller.selectedRateType.value == RateType.hourly,
                    onTap: () => controller.setRateType(RateType.hourly),
                  ),
                  SizedBox(width: 24.w),
                  _buildRadioButton(
                    label: 'Fixed Price',
                    isSelected: controller.selectedRateType.value == RateType.fixed,
                    onTap: () => controller.setRateType(RateType.fixed),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFF101824),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              child: TextField(
                controller: controller.priceController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      '\$',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8FA1B5),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  hintText: '0.00',
                  hintStyle: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // ৫. PERSONAL MESSAGE Section
            Text(
              'PERSONAL MESSAGE',
              style: GoogleFonts.dmSans(
                color: const Color(0xFF8FA1B5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 12.h),

            // Message Input Box
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white.withAlpha(100),
                ),
              ),
              child: TextField(
                controller: controller.messageController,
                maxLines: 4,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText:
                  'Hi Sarah! I\'d love to help walk your dog. I have 5 years of experience with large breeds...',
                  hintStyle: GoogleFonts.dmSans(
                    color: const Color(0xFFB2B2B7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Info Note
            Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: const Color(0xFFE5BA73),
                  size: 16.r,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Keep it professional to build trust.',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFEDC286),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: controller.sendOffer,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1D199),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Center(
                  child: Text(
                    'Send Offer',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF1E160D),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF8FA1B5),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
  Widget _buildRadioButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20.r,
            height: 20.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xFFF1D199) : const Color(0xFF637488),
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF1D199),
                ),
              ),
            )
                : null,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}