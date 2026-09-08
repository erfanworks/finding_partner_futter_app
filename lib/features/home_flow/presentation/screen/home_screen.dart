import 'package:amychebbi/core/constants/app_color.dart';
import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../nav_bar_flow/screen/nav_bar.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBackgroundColor,
        surfaceTintColor: AppColors.appBackgroundColor,
        elevation: 0,
        toolbarHeight: 65.h,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Dubai, UAE",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFB2B2B7),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sara",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          _buildIconButton(
            AppImages.calendarIcon,
            onTap: () => Get.toNamed(AppRoutes.bookingsScreen),
          ),
          SizedBox(width: 8.w),
          _buildIconButton(
            AppImages.notificationIcon,
            onTap: () => Get.toNamed(AppRoutes.notificationScreen),
          ),
          SizedBox(width: 8.w),
          _buildIconButton(
            AppImages.messageIcon,
            onTap: () => Get.toNamed(AppRoutes.messageListScreen),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildSearchBar(),
              SizedBox(height: 18.h),
              _buildLeaderboardButton(),
              SizedBox(height: 20.h),
              _buildSectionTitle("Active Booking"),
              SizedBox(height: 10.h),
              _buildActiveBookingCard(),
              SizedBox(height: 20.h),
              _buildSectionHeader(
                "Next Bookings",
                onTap: () => Get.toNamed(AppRoutes.myBookingScreen),
              ),
              SizedBox(height: 10.h),
              _buildBookingListItem(
                "natasharamano, 27",
                "Gaming",
                "\$45",
                "45 mins",
              ),
              SizedBox(height: 10.h),
              _buildBookingListItem(
                "natasharamano, 27",
                "Gaming",
                "\$45",
                "2 days 4 hr",
                subDetail: "1 Session • 2PM - 4PM",
              ),
              SizedBox(height: 20.h),
              _buildSectionHeader("New Booking Request"),
              SizedBox(height: 10.h),
              _buildBookingListItem(
                "natasharamano, 27",
                "Gaming",
                "\$45",
                "In 2 hrs 30 mins",
                isAlert: true,
              ),
              SizedBox(height: 10.h),
              _buildBookingListItem(
                "natasharamano, 27",
                "Gaming",
                "\$45",
                "2 days 4 hr",
                subDetail: "1 Session • 2PM - 4PM",
              ),
              SizedBox(height: 20.h),
              _buildSectionHeader(
                "My Companion Requests",
                onTap: () => Get.toNamed(AppRoutes.companionBookingsScreen),
              ),
              SizedBox(height: 14.h),
              _buildCategoryTabs(),
              SizedBox(height: 14.h),
              _buildCompanionRequestCard(),
              SizedBox(height: 20.h),
              _buildSectionHeader(
                "Community Feed",
                actionText: "View All",
                actionIcon: AppImages.viewAllIcon,
                onTap: () => Get.toNamed(AppRoutes.communityFeedScreen),
              ),
              SizedBox(height: 10.h),
              _buildCommunityPostCard(),
              SizedBox(height: 10.h),
              _buildAvailabilityStatus(),
              SizedBox(height: 20.h),
              _buildSectionHeader(
                "Browse Categories",
                onTap: () => Get.toNamed(AppRoutes.categoriesScreen),
              ),
              SizedBox(height: 12.h),
              _buildCategoriesGrid(),
              SizedBox(height: 10.h),
              Divider(color: Color(0xFF645138)),
              SizedBox(height: 10.h),
              _buildBannerCard(),
              SizedBox(height: 10.h),
              Divider(color: Color(0xFF645138)),
              SizedBox(height: 10.h),
              _buildSectionHeader("Available now"),
              SizedBox(height: 12.h),
              _buildAvailableNowGrid(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(String iconPath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color:  Colors.white.withAlpha(20),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 24.sp,
          width: 24.sp,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.searchScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFF131B29),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.searchIcon,
              colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
              height: 24.sp,
              width: 24.sp,
            ),
            SizedBox(width: 10.w),
            Text(
              "What are you looking for?",
              style: GoogleFonts.dmSans(
                color: Color(0xFFB2B2B7),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.leaderBoardScreen);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF383945),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: const Color(0xFFB78134), width: 2.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.leaderboardIcon,
              colorFilter: const ColorFilter.mode(Color(0xFFEDC286), BlendMode.srcIn),
              height: 24.sp,
              width: 24.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              "Leaderboard",
              style: GoogleFonts.dmSans(
                color: const Color(0xFFEDC286),
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionHeader(
    String title, {
    String actionText = "See all >",
    String? actionIcon,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                actionText,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFEDC286),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              if (actionIcon != null) ...[
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  actionIcon,
                  height: 14.sp,
                  width: 14.sp,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFEDC286),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActiveBookingCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFC69C5E), Color(0xFF8C6633)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "alexander, 21",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF645138),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Total paid",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF645138),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Social Talking",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF383945),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "\$42.00",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF383945),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Hourly rate",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF645138),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.japansCoin,
                    height: 18.sp,
                    width: 18.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "45.0 Seirus",
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF383945),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: const NetworkImage(
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Elapsed Time",
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFFFFFFF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "01:24:08",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.timer_sharp, color: Colors.white38, size: 50.sp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookingListItem(
    String name,
    String tag,
    String price,
    String time, {
    String? subDetail,
    bool isAlert = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(width: 1.w, color: Color(0xFF3D4754)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tag,
                style: GoogleFonts.dmSans(
                  color: Color(0xFF8C8D94),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subDetail != null)
                Text(
                  subDetail,
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF8C8D94),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: GoogleFonts.dmSans(
                  color: Color(0xFFEDC286),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.dmSans(
                  color: isAlert ? Color(0xFFEDC286) : Color(0xFFFF8D28),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    List<String> tabs = ["Outstanding (2)", "Confirmed", "Completed"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          bool isSelected = tab.startsWith("Outstanding");
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [Color(0xFFEDC286), Color(0xFFB17D35)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              color: isSelected ? null : Color(0xFFE6E6E8),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              tab,
              style: GoogleFonts.dmSans(
                color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF464555),
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCompanionRequestCard() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.requestDetailsScreen);
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(width: 1.w, color: Color(0xFF3D4754)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "elvinangela, 27",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Travel • 1 Session",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFEDC286),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Mon 12, Dec • 4:00pm - 2 hrs",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFB2B2B7),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Color(0xFFFFFFFF), size: 40.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityPostCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jamie L. 27",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Music • 1 hrs 30",
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF8C8D94),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "10 m ago",
              style: GoogleFonts.dmSans(
                color: Color(0xFFB2B2B7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "Looking for a fitness partner for a morning run in Central Park. Pace 5:00/km.",
          style: GoogleFonts.dmSans(
            color: Color(0xFFE6E6E8),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            'https://images.unsplash.com/photo-1448375240586-882707db888b',
            height: 140.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 12.h),
        const Divider(color: Color(0xFF3D4754), thickness: 1),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.messageIcon,
              colorFilter: const ColorFilter.mode(Color(0xFFB2B2B7), BlendMode.srcIn),
              height: 22.sp,
              width: 22.sp,
            ),
            SizedBox(width: 4.w),
            Text(
              "12 Comments",
              style: GoogleFonts.dmSans(
                color: Color(0xFFE6E6E8),
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: Color(0xFFEDC286)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999.r),
                ),
              ),
              child: Text(
                "Send Message",
                style: GoogleFonts.dmSans(
                  color: Color(0xFFEDC286),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid() {
    List<Map<String, dynamic>> categories = [
      {"icon": AppImages.travelImg, "name": "Travel"},
      {"icon": AppImages.gamingImg, "name": "Gaming"},
      {"icon": AppImages.activitiesImg, "name": "Activities"},
      {"icon": AppImages.messageImg, "name": "Social Talking"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((cat) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFF131B29),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white10),
              ),
              child: Image.asset(cat["icon"], height: 25.sp, width: 25.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              cat["name"],
              style: GoogleFonts.dmSans(
                color: Color(0xFFFFFFFF),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildBannerCard() {
    final HomeController controller = Get.put(HomeController());

    return Column(
      children: [
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.bannerList.length,
            onPageChanged: (index) {
              controller.updateBannerIndex(index);
            },
            itemBuilder: (context, index) {
              final item = controller.bannerList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  image: DecorationImage(
                    image: NetworkImage(item["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.black.withValues(alpha: 0.2),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"]!,
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item["subtitle"]!,
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFFEDC286),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: const Color(0xFFEDC286),
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.bannerList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 8.h,
                width: controller.currentBannerIndex.value == index
                    ? 32.w
                    : 8.w,
                decoration: BoxDecoration(
                  color: controller.currentBannerIndex.value == index
                      ? const Color(0xFFEDC286)
                      : Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableNowGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildUserCard(
            "Natasha Romano, 27",
            "Gaming",
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildUserCard(
            "Natasha Romano",
            "Music",
            'https://images.unsplash.com/photo-1517841905240-472988babdf9',
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard(String name, String tag, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.companionDetailsScreen);
      },
      child: Container(
        height: 280.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.5), // Image pushed more towards the top
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black, // Opaque black at the very bottom
                Colors.black.withOpacity(0.8),
                Colors.transparent,
              ],
              stops: const [0.0, 0.4, 0.7], // Solid black area at bottom, then fades
            ),
          ),
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2), // Added spacer to push content down
              Text(
                name,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tag,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFEDC286),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStat("4.5", "Rating"),
                  _buildVerticalDivider(),
                  _buildStat("45+", "Jobs"),
                  _buildVerticalDivider(),
                  _buildStat("\$45/hr", "Rate"),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDC286),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        "Send Message",
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF090E17),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFF131B29).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailabilityStatus() {
    return Column(
      children: [
        const Divider(color: Color(0xFF3D4754), thickness: 1),
        SizedBox(height: 12.h),
        Row(
          children: [
            SizedBox(
              width: 75.w,
              height: 35.h,
              child: Stack(
                children: [
                  _buildMiniAvatar(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                    0,
                  ),
                  _buildMiniAvatar(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                    20,
                  ),
                  _buildMiniAvatar(
                    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
                    40,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "3 companions available",
              style: GoogleFonts.dmSans(
                color: const Color(0xFF10B981),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEDC286),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                "Available",
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF090E17),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        const Divider(color: Color(0xFF645138), thickness: 1),
      ],
    );
  }

  Widget _buildMiniAvatar(String url, double left) {
    return Positioned(
      left: left.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF0C131D), width: 2.w),
        ),
        child: CircleAvatar(
          radius: 16.r,
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30.h,
      width: 1.w,
      color: Colors.white24,
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label == "Rating")
              Icon(Icons.star, color: const Color(0xFFFF8D28), size: 18.sp),
            if (label == "Jobs")
              Icon(Icons.check, color: const Color(0xFF10B981), size: 18.sp),
            if (label == "Rate") const SizedBox.shrink(),
            if (label != "Rate") SizedBox(width: 4.w),
            Text(
              value,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: Colors.white70,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
