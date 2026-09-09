import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/friends_controller.dart';


class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FriendsController());

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
          'Friends',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // 1. Search Bar
            _buildSearchBar(controller),
            SizedBox(height: 16.h),

            // 2. Friends List
            Expanded(
              child: Obx(
                    () => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.filteredList.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white.withValues(alpha: 0.08),
                    height: 24.h,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    final friend = controller.filteredList[index];
                    return _buildFriendTile(friend, controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search Input Field Component
  Widget _buildSearchBar(FriendsController controller) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: TextField(
        controller: controller.searchController,
        onChanged: controller.searchFriend,
        style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: 'Search friend',
          hintStyle: GoogleFonts.dmSans(
            color: const Color(0xFF5F6E82),
            fontSize: 14.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 10.w),
            child: SvgPicture.asset(
              AppImages.searchIcon,
              colorFilter: const ColorFilter.mode(
                Color(0xFF8C9BAE),
                BlendMode.srcIn,
              ),
              height: 20.r,
              width: 20.r,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
    );
  }

  // Individual Friend Row Tile
  Widget _buildFriendTile(FriendModel friend, FriendsController controller) {
    return Row(
      children: [
        // Profile Avatar
        CircleAvatar(
          radius: 26.r,
          backgroundColor: const Color(0xFF151F30),
          backgroundImage: NetworkImage(friend.avatarUrl),
        ),
        SizedBox(width: 14.w),

        // Info Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${friend.name}, ${friend.age}',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                friend.category,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),

        // Unfriend Action Text Button
        TextButton(
          onPressed: () => controller.unfriend(friend.id),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Unfriend',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFFF383C),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}