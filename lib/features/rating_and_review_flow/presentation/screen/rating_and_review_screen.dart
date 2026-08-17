import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/rating_and_review_controller.dart';


class RatingReviewScreen extends StatelessWidget {
  const RatingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C1421),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Rating & Reviews',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: GetBuilder<RatingReviewController>(
        init: RatingReviewController(),
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            children: [
              // Top Overview Card
              _buildRatingOverviewCard(controller),
              SizedBox(height: 16.h),

              // Reviews List
              ...controller.reviews.map((review) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildReviewCard(review),
              )),
            ],
          );
        },
      ),
    );
  }

  // Top Rating Breakdown Component
  Widget _buildRatingOverviewCard(RatingReviewController controller) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side - Overall Rating Score
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${controller.averageRating}',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFE88B35),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star_rounded,
                    color: const Color(0xFFE88B35),
                    size: 16.r,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '${controller.totalReviews} reviews',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w),

          // Right Side - Rating Progress Bars
          Expanded(
            child: Column(
              children: [5, 4, 3, 2, 1].map((star) {
                final count = controller.ratingCounts[star] ?? 0;
                final double progress = controller.maxRatingCount > 0
                    ? count / controller.maxRatingCount
                    : 0.0;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Text(
                        '$star',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 6.h,
                            backgroundColor: const Color(0xFF233044),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFE5B069),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 24.w,
                        child: Text(
                          '$count',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF8C9BAE),
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Individual Review Card Component
  Widget _buildReviewCard(ReviewModel review) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Profile Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(review.avatarUrl),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${review.username}, ${review.age}',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: List.generate(
                        review.rating.toInt(),
                            (index) => Icon(
                          Icons.star_rounded,
                          color: const Color(0xFFE88B35),
                          size: 16.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                review.timeAgo,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.more_vert, color: Colors.white54, size: 18.r),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            review.comment,
            style: GoogleFonts.dmSans(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 12.sp,
              height: 1.4,
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.reply,
                  color: const Color(0xFFE5B069),
                  size: 16.r,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Reply',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFE5B069),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (review.reply != null) ...[
            SizedBox(height: 12.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 16.w),
                CircleAvatar(
                  radius: 14.r,
                  backgroundImage: NetworkImage(review.reply!.avatarUrl),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${review.reply!.username}, ${review.reply!.age}',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                review.reply!.timeAgo,
                                style: GoogleFonts.dmSans(
                                  color: const Color(0xFF8C9BAE),
                                  fontSize: 10.sp,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(Icons.more_vert, color: Colors.white54, size: 16.r),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        review.reply!.comment,
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF8C9BAE),
                          fontSize: 11.sp,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}