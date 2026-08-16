import 'package:amychebbi/core/constants/app_color.dart';
import 'package:amychebbi/core/constants/app_images.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../nav_bar_flow/screen/nav_bar.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.appBackgroundColor,
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
          'My Profile',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Color(0xFF3D4754), width: 1.5.w),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'tanvirchowdhury, 27',
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Male  •  Florida',
                              style: GoogleFonts.dmSans(
                                color: Color(0xFF8C8D94),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            AppImages.criminalImage,
                            height: 70.h,
                            width: 70.w,
                          ),
                          Text(
                            'CLEAN CRIMINAL\nRECORD',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              color: Color(0xFFEDC286),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF223042), width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildTabButton(
                        title: 'Seller Hub',
                        isSelected: controller.selectedTabIndex == 0,
                        onTap: () => controller.changeTab(0),
                      ),
                      SizedBox(width: 24.w),
                      _buildTabButton(
                        title: 'Account',
                        isSelected: controller.selectedTabIndex == 1,
                        onTap: () => controller.changeTab(1),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),
                controller.selectedTabIndex == 0
                    ? _buildSellerHubTab(controller)
                    : _buildAccountTab(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFFE5BA73) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.dmSans(
            color: isSelected
                ? const Color(0xFFE5BA73)
                : const Color(0xFF8FA1B5),
            fontSize: 16.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSellerHubTab(ProfileController controller) {
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.8,
          children: const [
            _HubCard(icon: Icons.calendar_today_outlined, title: 'Bookings'),
            _HubCard(icon: Icons.build_outlined, title: 'Services'),
            _HubCard(icon: Icons.monetization_on_outlined, title: 'Finance'),
            _HubCard(icon: Icons.access_time_rounded, title: 'Availability'),
          ],
        ),

        SizedBox(height: 12.h),

        _buildMenuItem(
          icon: Icons.bookmark_border_rounded,
          title: 'Saved Feed',
        ),
        _buildMenuItem(
          icon: Icons.account_balance_wallet_outlined,
          title: 'Wallet',
        ),
        _buildMenuItem(icon: Icons.bar_chart_rounded, title: 'Analytics'),
        _buildMenuItem(
          icon: Icons.calendar_month_outlined,
          title: 'Booking History',
          onTap: (){
            Get.toNamed(AppRoutes.bookingHistoryScreen);
          },
        ),
        _buildMenuItem(
          icon: Icons.face_retouching_natural_outlined,
          title: 'Verification',
        ),
        _buildMenuItem(
          icon: Icons.military_tech_outlined,
          title: 'Rank & Reputation',
        ),
        _buildMenuItem(icon: Icons.leaderboard_outlined, title: 'Leaderboard',onTap: (){
          Get.toNamed(AppRoutes.leaderBoardScreen);
        }),
        _buildMenuItem(
          icon: Icons.rate_review_outlined,
          title: 'Ratings & Review',
        ),

        // Vacation Mode ListTile
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D2A3B),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.beach_access_outlined,
                  color: const Color(0xFFE5BA73),
                  size: 20.r,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vacation Mode',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Temporary your shop will be out of service',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFF8FA1B5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: controller.isVacationModeOn,
                  onChanged: (value) => controller.toggleVacationMode(value),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountTab() {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.person_outline_rounded,
          title: 'Account information',
        ),
        _buildMenuItem(icon: Icons.people_outline_rounded, title: 'Friends'),
        _buildMenuItem(
          icon: Icons.calendar_today_outlined,
          title: 'My Bookings',
        ),
        _buildMenuItem(icon: Icons.storefront_outlined, title: 'Shop'),
        _buildMenuItem(icon: Icons.favorite_border_rounded, title: 'Favorites'),
        _buildMenuItem(
          icon: Icons.card_membership_outlined,
          title: 'Membership',
        ),
        _buildMenuItem(icon: Icons.shield_outlined, title: 'Trust & Safety'),
        _buildMenuItem(icon: Icons.settings_outlined, title: 'Setting'),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
        leading: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: const Color(0xFF1D2A3B),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: const Color(0xFFE5BA73), size: 20.r),
        ),
        title: Text(
          title,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white70,
          size: 14,
        ),
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _HubCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF162232),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: const Color(0xFFE5BA73), size: 22.r),
          Text(
            title,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
