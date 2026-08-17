import 'package:amychebbi/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/seiru_wallet_controller.dart';


class SeiruWalletScreen extends StatelessWidget {
  const SeiruWalletScreen({super.key});

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
          'Seiru',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SeiruWalletController>(
        init: SeiruWalletController(),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      Container(
                        width: 170.r,
                        height: 170.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFF8D622F), Color(0xFF382312)],
                            center: Alignment.topLeft,
                          ),
                          border: Border.all(color: const Color(0xFFE5B069), width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFE5B069).withValues(alpha: 0.15),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '生',
                              style: TextStyle(
                                fontSize: 60.sp,
                                color: const Color(0xFFE5B069),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'SEIRU',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFFE5B069),
                                fontSize: 14.sp,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        '${controller.availableSeiru}',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFFE5B069),
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Available Seiru',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFFBF7815),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: 170.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.r),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE5B069), Color(0xFFB87B2E)],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: controller.onGetSeiruPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21.r),
                            ),
                          ),
                          child: Text(
                            'Get Seiru',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFF0A111E),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),
                Text(
                  'Recent Transactions',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF131B2B),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.transactions.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.white.withValues(alpha: 0.05),
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.transactions[index];
                      return _buildTransactionRow(item);
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildTransactionRow(TransactionModel item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: [
          SizedBox(
            width: 18.w,
            child: Text(
              '${item.index}',
              style: GoogleFonts.dmSans(
                color: const Color(0xFF8C9BAE),
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Icon(
            item.isDebit ? Icons.arrow_downward_rounded : Icons.arrow_downward_rounded,
            color: item.isDebit ? const Color(0xFFFF4D4D) : const Color(0xFF22C55E),
            size: 18.r,
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 18.r,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  item.subtitle,
                  style: GoogleFonts.dmSans(
                    color: item.isDebit ? const Color(0xFFB2B2B7) : const Color(0xFF22C55E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '${item.amount}',
                style: GoogleFonts.dmSans(
                  color: item.isDebit ? const Color(0xFFFF4D4D) : const Color(0xFF22C55E),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                'Seiru',
                style: GoogleFonts.dmSans(
                  color:  Color(0xFFB2B2B7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}