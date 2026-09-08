import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/componing_details_controller.dart';
import '../widget/hexagonBadge_widget.dart';

class CompanionDetailsScreen extends StatelessWidget {
  const CompanionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompanionDetailsController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A111A),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 90.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderImage(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      _buildProfileInfo(),
                      SizedBox(height: 18.h),
                      _buildStatsBar(),
                      SizedBox(height: 18.h),
                      _buildTabSelector(controller),
                      SizedBox(height: 18.h),
                      _buildTopTippers(),
                      SizedBox(height: 22.h),
                      _buildSectionTitle("ABOUT"),
                      SizedBox(height: 8.h),
                      Text(
                        "Born-and-raised Miamian, foodie & sunset chaser. I'll show you the city locals actually love. Born-and-raised Miamian, foodie & sunset chaser. I'll show you the city locals actually love. Born-and-raised Miamian, foodie & sunset chaser. I'll show you the city locals actually love.",
                        style: GoogleFonts.dmSans(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _buildSectionTitle("SKILLS"),
                      SizedBox(height: 10.h),
                      _buildSkillsSection(),
                      SizedBox(height: 20.h),
                      _buildSectionTitle("COLLECTION"),
                      SizedBox(height: 10.h),
                      _buildCollectionSection(),
                      SizedBox(height: 20.h),
                      _buildSectionTitle("LANGUAGE"),
                      SizedBox(height: 10.h),
                      _buildLanguageSection(),
                      SizedBox(height: 20.h),
                      _buildSectionTitle("TRUST"),
                      SizedBox(height: 10.h),
                      _buildTrustSection(),
                      SizedBox(height: 20.h),
                      _buildRatingsHeader(),
                      SizedBox(height: 12.h),
                      _buildReviewCard(
                        name: "khaleda, 45",
                        subTitle: "Gaming - PlayStation",
                        date: "17 october, 2020",
                        review:
                            "Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!",
                      ),
                      SizedBox(height: 10.h),
                      _buildReviewCard(
                        name: "khaleda, 45",
                        subTitle: "Travel",
                        date: "17 october, 2020",
                        review:
                            "Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 20.h,
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEDC286),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.selectDateTimeScreen);
                },
                child: Text(
                  "Availability",
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF0A111A),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      children: [
        Container(
          height: 400.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 400.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.transparent,
                const Color(0xFF0A111A),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 45.h,
          left: 16.w,
          right: 16.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
                onPressed: () => Get.back(),
              ),
              Row(
                children: [
                  _buildCircleIconButton(Icons.favorite_border),
                  SizedBox(width: 10.w),
                  _buildCircleIconButton(Icons.group_outlined),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)
      ),
      child: Icon(icon, color: Colors.white, size: 18.sp),
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(2.r),
          decoration: const BoxDecoration(
            color: Color(0xFFE55B81),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 30.r,
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
            ),
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
                    "Natasha Romario, 27",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.verified,
                    color: const Color(0xFF2196F3),
                    size: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                "Male  •  German, English",
                style: GoogleFonts.dmSans(
                  color: Color(0xFFB2B2B7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Gaming - Xbox",
                style: GoogleFonts.dmSans(
                  color: Color(0xFFB2B2B7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF221A10),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Top Companion",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFFF8D28),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    "assets/images/star_compenion_img.png",
                    height: 22.h,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    "assets/images/criminal_image.png",
                    height: 40.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            _buildActionIcon("assets/icons/messege_icon.svg"),
            SizedBox(width: 8.w),
            _buildActionIcon("assets/icons/gift_icon.svg"),
          ],
        ),
      ],
    );
  }

  Widget _buildActionIcon(String iconPath) {
    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: 18.sp,
        height: 18.sp,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildStatsBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("\$45", "Per hour"),
          Container(
            height: 16.h,
            width: 1.w,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          Row(
            children: [
              Icon(Icons.check, color: const Color(0xFF2ECC71), size: 14.sp),
              SizedBox(width: 4.w),
              _buildStatItem("45+", "Jobs"),
            ],
          ),
          Container(
            height: 16.h,
            width: 1.w,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          Row(
            children: [
              Icon(Icons.star, color: const Color(0xFFE67E22), size: 15.sp),
              SizedBox(width: 4.w),
              _buildStatItem("4.5", "(128 reviews)"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String subtitle) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title ",
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: subtitle,
            style: GoogleFonts.dmSans(
              color: Color(0xFFFFFFFF),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector(CompanionDetailsController controller) {
    final tabs = ["Tips", "Gifts", "Bookings"];
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Obx(
        () => Row(
          children: List.generate(
            tabs.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    gradient: controller.selectedTabIndex.value == index
                        ? const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFECC27D), Color(0xFFB58843)],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tabs[index],
                    style: GoogleFonts.dmSans(
                      color: controller.selectedTabIndex.value == index
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF8C8D94),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopTippers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTipperItem(rank: "1", name: "Anonymous", amount: "\$550.00"),
        _buildTipperItem(rank: "2", name: "Anonymous", amount: "\$520.00"),
        _buildTipperItem(rank: "3", name: "Anonymous", amount: "\$500.00"),
      ],
    );
  }

  Widget _buildTipperItem({
    required String rank,
    required String name,
    required String amount,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Container(
                padding: EdgeInsets.all(3.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFECC27D), Color(0xFF7A4E12)],
                  ),
                ),
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -10.h,
              child: Container(
                padding: EdgeInsets.all(3.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFECC27D), Color(0xFF7A4E12)],
                  ),
                ),
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: Colors.white,
                  child: Text(
                    rank,
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFCD9341),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        HexagonBadge(text: name),
        SizedBox(height: 6.h),
        Text(
          amount,
          style: GoogleFonts.dmSans(
            color: Color(0xFFEDC286),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Row(
      children: [
        _buildSkillChip("assets/images/airplan_img.png", "Travel"),
        SizedBox(width: 10.w),
        _buildSkillChip("assets/images/business_img.png", "Business"),
        SizedBox(width: 10.w),
        _buildSkillChip("assets/images/gaming.png", "Gaming"),
      ],
    );
  }

  Widget _buildSkillChip(String imagePath, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 16.h),
          SizedBox(width: 6.w),
          Text(
            label,
            style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionSection() {
    return Row(
      children: [
        Expanded(child: _buildCollectionCard("Europe Trip")),
        SizedBox(width: 12.w),
        Expanded(child: _buildCollectionCard("Europe Trip")),
      ],
    );
  }

  Widget _buildCollectionCard(String title) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1448375240586-882707db888b",
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        color: Colors.black.withValues(alpha: 0.3),
        child: Text(
          title,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSection() {
    return Row(
      children: [
        _buildLanguageChip("English", "Native"),
        SizedBox(width: 10.w),
        _buildLanguageChip("English", "Fluent"),
        SizedBox(width: 10.w),
        _buildLanguageChip("Spanish", "Fluent"),
      ],
    );
  }

  Widget _buildLanguageChip(String lang, String level) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w,color: Color(0xFF3D4754)),
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(23.r),
      ),
      child: Column(
        children: [
          Text(
            lang,
            style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 2.h),
          Text(
            level,
            style: GoogleFonts.dmSans(
              color: level == "Native"
                  ? const Color(0xFF34C759)
                  : const Color(0xFF00C0E8),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrustSection() {
    return Row(
      children: [
        _buildTrustItem("Verified", Color(0xFF2ECC71), Color(0xFF34C759)),
        SizedBox(width: 20.w),
        _buildTrustItem("Clean Criminal Record", Color(0xFFB2B2B7), Color(0xFFB2B2B7)),
      ],
    );
  }

  Widget _buildTrustItem(String text, Color iconColor, Color textColor) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: iconColor,
          size: 22.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: GoogleFonts.dmSans(
            color: textColor,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionTitle("RATINGS & REVIEWS"),
        Row(
          children: [
            Text(
              "See all",
              style: GoogleFonts.dmSans(
                color: const Color(0xFFEDC286),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFFEDC286),
              size: 16.sp,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required String name,
    required String subTitle,
    required String date,
    required String review,
  }) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                date,
                style: GoogleFonts.dmSans(
                  color: Color(0xFFB2B2B7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.orange, size: 14.sp),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            review,
            style: GoogleFonts.dmSans(
              color: Color(0xFFB2B2B7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
          color: Color(0xFFB2B2B7),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600
      ),
    );
  }
}
