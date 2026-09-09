import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/verificationCenterController.dart';


class VerificationCenterScreen extends StatelessWidget {
  const VerificationCenterScreen({super.key});

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
          'Verification Center',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<VerificationCenterController>(
        init: VerificationCenterController(),
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            children: [
              // 1. Top Progress Card
              _buildProgressOverviewCard(controller),
              SizedBox(height: 24.h),

              // 2. Shield Logo & Trust & Safety Title
              _buildTrustHeader(),
              SizedBox(height: 20.h),

              // 3. Confirm Identity Card (Green Outline / Verified)
              _buildIdentityCard(controller),
              SizedBox(height: 16.h),

              // 4. Criminal Check Card (Golden Button)
              _buildCriminalCheckCard(controller),
              SizedBox(height: 24.h),

              // 5. Footer Trust Message
              Text(
                'Real connection needs real trust.\nWe\'ve got your safety covered.',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 20.h),

              // 6. Green Encryption Banner Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F2D25),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  'Only verified users can book or offer companionship. Your data is encrypted and never shared.',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF22C55E),
                    fontSize: 11.sp,
                    height: 1.35,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          );
        },
      ),
    );
  }

  // Top Verification Status Overview Component
  Widget _buildProgressOverviewCard(VerificationCenterController controller) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VERIFICATION & TRUST',
            style: GoogleFonts.dmSans(
              color: const Color(0xFF8C9BAE),
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                controller.currentStatus,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${controller.completedSteps} of ${controller.totalSteps} Completed',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: controller.completedSteps / controller.totalSteps,
              minHeight: 10.h,
              backgroundColor: const Color(0xFF233044),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFE5B069),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Basic',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
              Text(
                'Verified',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
              Text(
                'Trusted +',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Trust & Safety Header Section with Cursive Text
  Widget _buildTrustHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Trust & Safety Icon
        Image.asset(
          AppImages.trustSafetyIcon,
          width: 60.r,
          height: 68.r,
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trust & Safety',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Every real interaction starts with real identity.',
                style: GoogleFonts.dmSans(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Every Companion is a real human in real life.\nBots and fakes have zero room here.',
                style: GoogleFonts.alexBrush(
                  color: const Color(0xFFE5B069),
                  fontSize: 18.sp,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Confirm Identity Section Widget
  Widget _buildIdentityCard(VerificationCenterController controller) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46.r,
                height: 46.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.5)),
                  color: const Color(0xFF0F2D25),
                ),
                child: Icon(
                  Icons.badge_outlined,
                  color: const Color(0xFF22C55E),
                  size: 24.r,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm your identity',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Have your government ID or passport ready. You\'ll also take a real-time photo or short video to confirm it\'s really you.',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8C9BAE),
                        fontSize: 11.sp,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFF163229),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: const Color(0xFF22C55E), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: const Color(0xFF22C55E),
                  size: 18.r,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Verified',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF22C55E),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Criminal Check Section Widget
  Widget _buildCriminalCheckCard(VerificationCenterController controller) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46.r,
                height: 46.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFE5B069).withValues(alpha: 0.5)),
                  color: const Color(0xFF2A2118),
                ),
                child: Icon(
                  Icons.shield_outlined,
                  color: const Color(0xFFE5B069),
                  size: 24.r,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Criminal Check (optional)',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Upload a clean criminal record certificate, not older than 6 months. Once verified, it\'s shown on your public profile — others can filter for it when searching for a Companion.',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8C9BAE),
                        fontSize: 11.sp,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          OutlinedButton(
            onPressed: controller.onUploadCriminalRecord,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE5B069), width: 1),
              minimumSize: Size(double.infinity, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              'Upload Now',
              style: GoogleFonts.dmSans(
                color: const Color(0xFFE5B069),
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}