import 'package:amychebbi/core/constants/app_color.dart';
import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/review_booking_controller.dart';
import '../widget/gift_bottom_sheet.dart';
import '../widget/seriue_bottom_sheet.dart';

class ReviewBookingScreen extends GetView<ReviewBookingController> {
  const ReviewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewBookingController());

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.appBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Review booking',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            SizedBox(height: 14.h),
            _buildBookingDetailsCard(),
            SizedBox(height: 14.h),
            _buildTipSection(),
            SizedBox(height: 14.h),
            _buildPaymentBreakdownCard(),
            SizedBox(height: 16.h),
            Text(
              'SPECIFIC REQUEST',
              style: GoogleFonts.dmSans(
                color: Color(0xFFB2B2B7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFF131F2C),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: TextField(
                controller: controller.requestController,
                maxLines: 3,
                style: GoogleFonts.dmSans(color: Color(0xFFE6E6E8), fontSize: 14.sp,fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
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
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF0CA93), Color(0xFFDCB172)],
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    'Continue to payment',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFF383945),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131F2C),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              width: 75.w,
              height: 75.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'natasharahman, 27',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Image.asset(
                      AppImages.hexagramShapeIcon,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  'Female  •  Gaming  •  Miami, USA\nEnglish, Arabic, Hindi',
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFB2B2B7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 20,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '4.5',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFDA7113),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(128)',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFF8C8D94),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            children: [
              Image.asset(AppImages.criminalImage,height: 80.h,width: 80.w,),
              Text(
                'CLEAN CRIMINAL\nRECORD',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: Color(0xFFEDC286),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookingDetailsCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131F2C),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          _buildDetailRow('Date', '24 September, 2026'),
          SizedBox(height: 10.h),
          _buildDetailRow('Time', '9:00PM'),
          SizedBox(height: 10.h),
          _buildDetailRow('Duration', '2 hours'),
          SizedBox(height: 10.h),
          _buildDetailRow('Rate', '\$45.00'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: Color(0xFFE6E6E8),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400
          ),
        ),
        Text(
          value,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTipSection() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131F2C),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add a Tip',
            style: GoogleFonts.dmSans(
              color: Color(0xFFFFFFFF),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _buildTipChip('5%', '\$4.50', 0),
              SizedBox(width: 8.w),
              _buildTipChip('10%', '\$9.00', 1),
              SizedBox(width: 8.w),
              _buildTipChip('15%', '\$13.50', 2),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            height: 55.h,
            decoration: BoxDecoration(
              color: const Color(0xFF0D1722),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Color(0xFF3D4754),width: 1.5.w),
            ),
            child: Row(
              children: [
                Text(
                  '\$',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: controller.customTipController,
                    onChanged: (val) {
                      if (val.isNotEmpty)
                        controller.selectedTipIndex.value = -1;
                    },
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Custom amount',
                      hintStyle: GoogleFonts.dmSans(
                        color: const Color(0xFF8C8D94),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: _buildActionCard(
                  icon: Image.asset(AppImages.japansCoin, height: 22.h, width: 22.w),
                  title: 'Send Seirus',
                  subtitle: 'Direct support',
                  onTab: (){
                    Get.bottomSheet(
                      const SendSeirusBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  }
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildActionCard(
                  icon: SvgPicture.asset(
                    AppImages.calendarIcon,
                    height: 20.h,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(Color(0xFFECC27D), BlendMode.srcIn),
                  ),
                  title: 'Send a Gift',
                  subtitle: 'Browse shop',
                  onTab: (){
                    Get.bottomSheet(
                      const GiftsBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipChip(String percent, String amount, int index) {
    return Expanded(
      child: Obx(() {
        bool isSelected = controller.selectedTipIndex.value == index;
        return GestureDetector(
          onTap: () => controller.selectTip(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: isSelected ?Color(0xFFECC27D).withValues(alpha: 0.2) : Color(0xFF0D1722),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected
                    ? Color(0xFFECC27D)
                    : Color(0xFF3D4754),
                width: 1.5.w,
              ),
            ),
            child: Column(
              children: [
                Text(
                  percent,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  amount,
                  style: GoogleFonts.dmSans(
                    color: isSelected
                        ? const Color(0xFFEDC286)
                        : const Color(0xFF8C8D94),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildActionCard({
    required Widget icon,
    required String title,
    required String subtitle,
    required VoidCallback onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1722),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xFF3D4754)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: const Color(0xFF1B2838),
              child: icon,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: GoogleFonts.dmSans(
                color: Color(0xFFB2B2B7),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentBreakdownCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131F2C),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          _buildDetailRow('Subtotal', '\$90.00'),
          SizedBox(height: 10.h),
          _buildDetailRow('Service Fee', '\$5.00'),
          SizedBox(height: 10.h),
          _buildDetailRow('Tips', '\$5.00'),
          SizedBox(height: 10.h),
          _buildDetailRow('Taxes', '\$10.00'),
          SizedBox(height: 12.h),
          Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$45.00',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFECC27D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
