import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/financeController.dart';
import '../widget/chartPainter.dart';




class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

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
          'Finance',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Top Right Coin Badge
          GetBuilder<FinanceController>(
            init: FinanceController(),
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
                    child: Text('金', style: TextStyle(fontSize: 10.sp, color: Colors.black)),
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
      body: GetBuilder<FinanceController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Total Earnings Golden Card
                _buildTotalEarningsCard(controller),
                SizedBox(height: 20.h),

                // 2. Payout Setting Radio Options
                _buildSectionHeader('Payout Setting'),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    _buildRadioButton(
                      label: 'Scheduled',
                      value: 'Scheduled',
                      groupValue: controller.payoutSetting,
                      onTap: () => controller.setPayoutSetting('Scheduled'),
                    ),
                    SizedBox(width: 24.w),
                    _buildRadioButton(
                      label: 'Manual',
                      value: 'Manual',
                      groupValue: controller.payoutSetting,
                      onTap: () => controller.setPayoutSetting('Manual'),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _buildSectionHeader('Overview'),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Show:',
                      style: GoogleFonts.dmSans(color: const Color(0xFF8C9BAE), fontSize: 13.sp),
                    ),
                    SizedBox(width: 10.w),
                    _buildTimeframeDropdown(controller),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildEarningsChartCard(),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSectionHeader('Recent Transactions'),
                    Text(
                      '3 upcoming',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFE5B069),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                ...controller.recentTransactions.map((tx) => _buildTransactionCard(tx)),
                SizedBox(height: 16.h),
              ],
            ),
          );
        },
      ),
    );
  }

  // Golden Earnings Card
  Widget _buildTotalEarningsCard(FinanceController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xFFE5B069), Color(0xFFC38E46)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL EARNINGS',
            style: GoogleFonts.dmSans(
              color: Colors.black54,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            controller.totalEarnings,
            style: GoogleFonts.dmSans(
              color: const Color(0xFF0A111E),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Next payout ${controller.nextPayoutDate}',
            style: GoogleFonts.dmSans(
              color: Colors.black87,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Radio Select Control Component
  Widget _buildRadioButton({
    required String label,
    required String value,
    required String groupValue,
    required VoidCallback onTap,
  }) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 18.r,
            height: 18.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xFFE5B069) : const Color(0xFF5F6E82),
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 8.r,
                height: 8.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE5B069),
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
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Timeframe Dropdown Widget
  Widget _buildTimeframeDropdown(FinanceController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.selectedTimeframe,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70, size: 18.r),
          dropdownColor: const Color(0xFF151F30),
          style: GoogleFonts.dmSans(color: Colors.white, fontSize: 12.sp),
          items: controller.timeframes
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) {
            if (val != null) controller.setTimeframe(val);
          },
        ),
      ),
    );
  }

  // Custom Chart Widget
  Widget _buildEarningsChartCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earnings Figures',
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                width: 8.r,
                height: 8.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5B069),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                'Sales',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 180.h,
            width: double.infinity,
            child: CustomPaint(
              painter: ChartPainter(),
            ),
          ),
        ],
      ),
    );
  }

  // Transaction Item Row Card
  Widget _buildTransactionCard(TransactionItem tx) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.03)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(tx.avatarUrl),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.name,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  tx.date,
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF8C8D94),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          Text(
            tx.amount,
            style: GoogleFonts.dmSans(
              color: const Color(0xFF22C55E),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


