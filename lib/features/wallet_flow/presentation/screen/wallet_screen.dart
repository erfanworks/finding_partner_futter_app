import 'package:amychebbi/features/wallet_flow/presentation/screen/with_draw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A111E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Wallet',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(() {
            if (controller.selectedTabIndex.value == 0) {
              return Center(
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
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          // Custom Dynamic Tabs
          _buildTabBar(controller),

          Expanded(
            child: Obx(() {
              switch (controller.selectedTabIndex.value) {
                case 0:
                  return _buildPayoutsTab(controller);
                case 1:
                  return _buildBookingsTab(controller);
                case 2:
                  return _buildTipsTab(controller);
                default:
                  return _buildPayoutsTab(controller);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(WalletController controller) {
    final tabs = ['Payouts', 'Bookings', 'Tips'];
    return Column(
      children: [
        Obx(
          () => Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = controller.selectedTabIndex.value == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.setTab(index),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          tabs[index],
                          style: GoogleFonts.dmSans(
                            color: isSelected
                                ? const Color(0xFFE5B069)
                                : const Color(0xFF8C9BAE),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          height: 2.h,
                          color: isSelected
                              ? const Color(0xFFE5B069)
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Divider(color: Colors.white.withValues(alpha: 0.08), height: 1.h),
      ],
    );
  }

  Widget _buildPayoutsTab(WalletController controller) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'Balance',
          style: GoogleFonts.dmSans(
            color: Color(0xFF8C9BAE),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.payoutsBalance,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),

        // Payout Info Card
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: const Color(0xFF151F30),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: const Color(0xFFE5B069),
                    size: 20.r,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '${controller.availableForWithdrawal} Available for withdrawal',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFE6E6E8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Divider(color: Colors.white.withValues(alpha: 0.05)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.lock_outline,
                    color: const Color(0xFFE5B069),
                    size: 20.r,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '${controller.pendingBalance} will be available soon',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFE6E6E8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Color(0xFFEDC286).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: const Color(0xFFE5B069),
                      size: 18.r,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "There's a 24-hour holding period before payout. During this time, everyone can report an issue or file a claim. If no report is submitted, the payout is released automatically.",
                        style: GoogleFonts.dmSans(
                          color: Color(0xFFE6E6E8),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
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
          'History',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),

        ...List.generate(3, (index) => _buildHistoryTile()),

        SizedBox(height: 24.h),

        // Buttons
        ElevatedButton(
          onPressed: () => Get.to(() => WithdrawScreen()),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE5B069),
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          child: Text(
            'Withdraw',
            style: GoogleFonts.dmSans(
              color: const Color(0xFF0A111E),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFE5B069)),
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          child: Text(
            'Shop',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFE5B069),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // 2. Bookings Tab View
  Widget _buildBookingsTab(WalletController controller) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'Balance',
          style: GoogleFonts.dmSans(
            color: const Color(0xFF8C9BAE),
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.bookingsBalance,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.swap_vert, color: Colors.white70, size: 20.r),
          ],
        ),
        SizedBox(height: 12.h),
        ...controller.bookingsTransactions.map(
          (item) => _buildTransactionCard(item),
        ),
      ],
    );
  }

  // 3. Tips Tab View
  Widget _buildTipsTab(WalletController controller) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'Balance',
          style: GoogleFonts.dmSans(
            color: const Color(0xFF8C9BAE),
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.tipsBalance,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Tips',
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.swap_vert, color: Colors.white70, size: 20.r),
          ],
        ),
        SizedBox(height: 12.h),
        ...controller.tipsTransactions.map(
          (item) => _buildTransactionCard(item),
        ),
      ],
    );
  }

  // Universal Transaction Card Component
  Widget _buildTransactionCard(TransactionModel item) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(item.avatarUrl),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      item.subtitle,
                      style: GoogleFonts.dmSans(
                        color: item.isCopyable
                            ? const Color(0xFF4ADE80)
                            : const Color(0xFF8C9BAE),
                        fontSize: 11.sp,
                      ),
                    ),
                    if (item.isCopyable) ...[
                      SizedBox(width: 6.w),
                      Icon(
                        Icons.copy_rounded,
                        color: const Color(0xFF4ADE80),
                        size: 12.r,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Text(
            item.amount,
            style: GoogleFonts.dmSans(
              color: const Color(0xFFE5B069),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Payout History Item Component
  Widget _buildHistoryTile() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Withdrawal',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '12/12/2026',
                style: GoogleFonts.dmSans(
                  color: Color(0xFFB2B2B7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
          Text(
            '\$408.00',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFE5B069),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
