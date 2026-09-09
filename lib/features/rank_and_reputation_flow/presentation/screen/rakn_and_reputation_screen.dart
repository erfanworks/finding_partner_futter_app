import 'package:amychebbi/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/rank_and_reputation_controller.dart';


class RankReputationScreen extends StatelessWidget {
  const RankReputationScreen({super.key});

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
          'Rank & Reputation',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<RankReputationController>(
        init: RankReputationController(),
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            children: [
              // 1. Top Rank Card
              _buildTopRankCard(controller),
              SizedBox(height: 16.h),

              // 2. Stats 2x2 Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14.w,
                  mainAxisSpacing: 14.h,
                  childAspectRatio: 1.5,
                ),
                itemCount: controller.stats.length,
                itemBuilder: (context, index) {
                  final stat = controller.stats[index];
                  return _buildStatCard(stat);
                },
              ),
              SizedBox(height: 16.h),

              // 3. Progress Card
              _buildProgressCard(controller),
            ],
          );
        },
      ),
    );
  }

  // Top Banner Card with Gradient & Crown Icon
  Widget _buildTopRankCard(RankReputationController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE5B069), width: 1.2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4A2C11),
            Color(0xFF1B1813),
            Color(0xFF111722),
          ],
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.rankIcon,
            colorFilter: const ColorFilter.mode(Color(0xFFE5B069), BlendMode.srcIn),
            height: 44.r,
            width: 44.r,
          ),
          SizedBox(height: 8.h),
          Text(
            'CURRENT RANK',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFE5B069),
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            controller.currentRank,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            controller.rankSubtitle,
            style: GoogleFonts.dmSans(
              color: Colors.white70,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 14.h),
          InkWell(
            onTap: controller.onViewLeaderboard,
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFFE5B069).withValues(alpha: 0.5)),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFD39B52),
                    Color(0xFFA17235),
                  ],
                ),
              ),
              child: Text(
                'View Leaderboard',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(StatItem stat) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_giftcard_rounded,
            color: const Color(0xFFE5B069),
            size: 24.r,
          ),
          const Spacer(),
          Text(
            stat.value,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            stat.label,
            style: GoogleFonts.dmSans(
              color: const Color(0xFF8C9BAE),
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(RankReputationController controller) {
    final double progressRatio = controller.currentProgress / controller.totalProgress;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress to Elite',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${controller.currentProgress} / ${controller.totalProgress}',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFE5B069),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: progressRatio,
              minHeight: 10.h,
              backgroundColor: const Color(0xFF233044),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFE5B069),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            '${controller.reviewsNeeded} more 5-star reviews to unlock Elite rank',
            style: GoogleFonts.dmSans(
              color: const Color(0xFF8C9BAE),
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}