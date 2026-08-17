import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/wallet_controller.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalletController>();

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
          'Withdraw Money',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'Enter amount',
              style: GoogleFonts.dmSans(
                color: Color(0xFFB2B2B7),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => Text(
                '\$${controller.withdrawAmount.value}',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              '\$50.00\nAvailable Balance',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: const Color(0xFFB2B2B7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 36.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose Account',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ...controller.accounts.map(
              (acc) => Obx(() {
                final isSelected = controller.selectedAccount.value == acc.id;
                return GestureDetector(
                  onTap: () => controller.selectedAccount.value = acc.id,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: Colors.white70,
                          size: 24.r,
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                acc.title,
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                acc.subtitle,
                                style: GoogleFonts.dmSans(
                                  color: const Color(0xFFB2B2B7),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: isSelected
                              ? const Color(0xFFE5B069)
                              : Colors.white38,
                          size: 20.r,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5B069),
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              child: Text(
                'Confirm Withdraw',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF0A111E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
