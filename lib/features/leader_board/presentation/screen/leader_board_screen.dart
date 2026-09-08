import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/leader_board_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.leaderboardBgImg,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Leaderboard",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  _buildTabBar(controller),
                  SizedBox(height: 30.h),
                  _buildTopPodiumSection(),
                  SizedBox(height: 20.h),
                  _buildSupportersList(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(LeaderboardController controller) {
    List<String> tabs = ["Tips", "Gifts", "Bookings"];

    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131B29),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Obx(
            () => Row(
          children: List.generate(tabs.length, (index) {
            bool isSelected = controller.selectedTab.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                      colors: [Color(0xFFEDC286), Color(0xFFB17D35)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: GoogleFonts.dmSans(
                        color: isSelected ? Colors.white : const Color(0xFF8C8D94),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTopPodiumSection() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildPodiumBar(
                  name: "Alex C.",
                  amount: "8.2k USD",
                  imageUrl: "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2",
                  rank: "#2",
                  barHeight: 160.h,
                  barGradient: const LinearGradient(
                    colors: [Color(0xFF3E4E6C), Color(0xFF151C2A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(width: 12.w),
                _buildPodiumBar(
                  name: "Anonymous",
                  amount: "15.4 USD",
                  imageUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
                  rank: "#1",
                  barHeight: 210.h,
                  isFirst: true,
                  barGradient: const LinearGradient(
                    colors: [Color(0xFFF7C986), Color(0xFFC27C1B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(width: 12.w),
                _buildPodiumBar(
                  name: "Alex C.",
                  amount: "5.2k USD",
                  imageUrl: "https://images.unsplash.com/photo-1580489944761-15a19d654956",
                  rank: "#3",
                  barHeight: 160.h,
                  barGradient: const LinearGradient(
                    colors: [Color(0xFF3E4E6C), Color(0xFF151C2A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -20.h,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF7C986),
                      Color(0xFFE4A44D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  border: Border.all(
                    color: Color(0xFFB87827),
                    width: 4.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Top Supporters",
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF7A450B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
  Widget _buildPodiumBar({
    required String name,
    required String amount,
    required String imageUrl,
    required String rank,
    required double barHeight,
    required Gradient barGradient,
    bool isFirst = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(isFirst ? 3.r : 2.r),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4.w,
                  color: isFirst ? Colors.transparent : Colors.white,
                ),
                shape: BoxShape.circle,
                gradient: isFirst
                    ? const LinearGradient(colors: [Color(0xFFEDC286), Color(0xFFB17D35)])
                    : null,
              ),
              child: CircleAvatar(
                radius: isFirst ? 40.r : 35.r,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            if (isFirst)
              Positioned(
                top: -18.h,
                child: Image.asset(
                  AppImages.topBadge,
                  height: 30.sp,
                  width: 30.sp,
                ),
              ),
            Positioned(
              bottom: -2.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isFirst ? const Color(0xFFEDC286) : const Color(0xFFD6DBE1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  rank,
                  style: GoogleFonts.dmSans(
                    color: isFirst ? const Color(0xFF533714) : const Color(0xFF434A54),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          width: isFirst ? 120.w : 110.w,
          height: barHeight,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            gradient: barGradient,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                name,
                style: GoogleFonts.dmSans(
                  color: isFirst ? Color(0xFF121C2A) : Color(0xFFE6E6E8),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.money,
                    size: 20.sp,
                    color: isFirst ? const Color(0xFF533714) : const Color(0xFFEDC286),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    amount,
                    style: GoogleFonts.dmSans(
                      color: isFirst ? const Color(0xFF533714) : const Color(0xFFEDC286),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildSupportersList() {
    List<Map<String, String>> supporters = [
      {"rank": "4", "name": "Anonymous Supporter", "points": "4.2k Seirus"},
      {"rank": "6", "name": "Private Account", "points": "2.9k Seirus"},
      {"rank": "6", "name": "Private Account", "points": "2.9k Seirus"},
      {"rank": "4", "name": "Anonymous Supporter", "points": "4.2k Seirus"},
      {"rank": "7", "name": "Elena V.", "points": "1.5k Seirus"},
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: supporters.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white.withValues(alpha: 0.20),
          height: 1,
        ),
        itemBuilder: (context, index) {
          final item = supporters[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                  child: Text(
                    item["rank"]!,
                    style: GoogleFonts.dmSans(
                      color: Color(0xFFB2B2B7),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    item["name"]!,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: item["points"]!.split(" ")[0],
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFFEDC286),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " ${item["points"]!.split(" ")[1]}",
                        style: GoogleFonts.dmSans(
                          color: Color(0xFFB2B2B7),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}