import 'package:amychebbi/core/constants/app_color.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/community_feed_controller.dart';
import '../widget/sendOfferBottomSheet.dart';

class CommunityFeedScreen extends StatelessWidget {
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunityFeedController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: AppColors.appBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 18.sp,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Community Feed",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _buildCircleIconButton(Icons.notifications_none_outlined),
          SizedBox(width: 8.w),
          _buildCircleIconButton(Icons.chat_bubble_outline),
          SizedBox(width: 16.w),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 14.h),
              _buildToggleTab(controller),
              SizedBox(height: 16.h),
              _buildCreatePostBox(),
              SizedBox(height: 18.h),
              _buildFirstFeedPost(),
              SizedBox(height: 14.h),
              _buildCompanionsAvailableBar(
                statusText: "Available",
                statusColor: const Color(0xFFE5B573),
                textColor: const Color(0xFF131B29),
                onTab: (){
                  Get.bottomSheet(
                    const SendOfferBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                }
              ),
              SizedBox(height: 16.h),
              Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),
              SizedBox(height: 16.h),
              _buildSecondFeedPost(),
              SizedBox(height: 14.h),
              _buildCompanionsAvailableBar(
                statusText: "Offered",
                statusColor: const Color(0xFF2ECC71),
                textColor: Colors.white,
                onTab: (){

                }
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCircleIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Icon(icon, color: Colors.white, size: 20.sp),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xFF141F2E),
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Icon(Icons.search, color: Color(0xFF8C8D94), size: 25.sp),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: GoogleFonts.dmSans(
                        color: Color(0xFF8C8D94),
                        fontSize: 16.sp,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: const Color(0xFF141F2E),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Icon(Icons.tune, color: Colors.white, size: 20.sp),
        ),
      ],
    );
  }

  Widget _buildToggleTab(CommunityFeedController controller) {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: controller.selectedTab.value == 0
                        ? const LinearGradient(
                            colors: [Color(0xFFF0CB93), Color(0xFFD49E53)],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Center(
                    child: Text(
                      "NOW",
                      style: GoogleFonts.dmSans(
                        color: controller.selectedTab.value == 0
                            ? const Color(0xFF4A2E05)
                            : const Color(0xFF8C9BAE),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(1),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: controller.selectedTab.value == 1
                        ? const LinearGradient(
                            colors: [Color(0xFFF0CB93), Color(0xFFD49E53)],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Center(
                    child: Text(
                      "SCHEDULED",
                      style: GoogleFonts.dmSans(
                        color: controller.selectedTab.value == 1
                            ? const Color(0xFF4A2E05)
                            : const Color(0xFF8C9BAE),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCreatePostBox() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.createPostScreen);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFF141F2E),
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Text(
                "What would you like to share?",
                style: GoogleFonts.dmSans(
                  color: Color(0xFFB2B2B7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstFeedPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPostHeader(),
        SizedBox(height: 10.h),
        Text(
          "Looking for a fitness partner for a morning run in Central Park. Pace 5:30/km.",
          style: GoogleFonts.dmSans(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 13.sp,
            height: 1.4,
          ),
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
            'https://images.unsplash.com/photo-1448375240586-882707db888b',
            height: 180.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(
              Icons.chat_bubble_outline,
              color: const Color(0xFF8C9BAE),
              size: 18.sp,
            ),
            SizedBox(width: 6.w),
            RichText(
              text: TextSpan(
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 12.sp,
                ),
                children: const [
                  TextSpan(text: "12  Comented on "),
                  TextSpan(
                    text: "Jhon ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: "and "),
                  TextSpan(
                    text: "11 others",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFD49E53)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              ),
              child: Text(
                "Send Message",
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFD49E53),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSecondFeedPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPostHeader(),
        SizedBox(height: 10.h),
        Text(
          "Seeking a travel companion for the upcoming tech expo in Tokyo. Expenses shared.",
          style: GoogleFonts.dmSans(
            color: Color(0xFFE6E6E8),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }

  Widget _buildPostHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Jamie L, 27",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.hexagon,
                    color: const Color(0xFFD49E53),
                    size: 14.sp,
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFFD49E53).withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      "Gaming- Xbox",
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFD49E53),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                "Male  •  Florida",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF8C8D94),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(0xFFEDC286).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "3:30 PM",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFB2B2B7),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "15m ago",
              style: GoogleFonts.dmSans(
                color: Color(0xFF8C9BAE),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4.h),
            Icon(Icons.more_vert, color: const Color(0xFF8C9BAE), size: 18.sp),
          ],
        ),
      ],
    );
  }

  Widget _buildCompanionsAvailableBar({
    required String statusText,
    required Color statusColor,
    required Color textColor,
    required VoidCallback onTab,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 65.w,
          height: 26.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                  ),
                ),
              ),
              Positioned(
                left: 32.w,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          "3 companions available",
          style: GoogleFonts.dmSans(
            color: const Color(0xFF2ECC71),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTab,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Text(
              statusText,
              style: GoogleFonts.dmSans(
                color: textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
