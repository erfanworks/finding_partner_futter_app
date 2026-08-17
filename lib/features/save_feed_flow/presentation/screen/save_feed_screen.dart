import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/save_feed_controller.dart';


class SavedFeedScreen extends StatelessWidget {
  const SavedFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedFeedController());

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
          'Saved Feed',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
            () => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.savedFeeds.length,
          itemBuilder: (context, index) {
            final feed = controller.savedFeeds[index];
            return _buildFeedItem(feed, controller);
          },
        ),
      ),
    );
  }

  Widget _buildFeedItem(SavedFeedModel feed, SavedFeedController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: NetworkImage(feed.avatarUrl),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${feed.userName}, ${feed.age}',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.hexagon, color: const Color(0xFFE5B069), size: 16.r),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(color: const Color(0xFFE5B069).withValues(alpha: 0.5)),
                        ),
                        child: Text(
                          feed.categoryTag,
                          style: GoogleFonts.dmSans(
                            color: Color(0xFFEDC286),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${feed.gender}  •  ${feed.location}',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFF8C8D94),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDC286).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      feed.timeTag,
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 14.sp,
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
                  feed.postTime,
                  style: GoogleFonts.dmSans(
                    color: Color(0xFFB2B2B7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 12.h),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.more_vert, color: Colors.white70),
                  onPressed: () => controller.onMoreOptions(feed.id),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Text(
          feed.description,
          style: GoogleFonts.dmSans(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(height: 12.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
            feed.postImageUrl,
            width: double.infinity,
            height: 190.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.chat_bubble_outline_rounded, color: Colors.white, size: 20.r),
                SizedBox(width: 6.w),
                Text(
                  '${feed.commentCount}',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.dmSans(color: const Color(0xFF8C9BAE), fontSize: 11.sp),
                    children: [
                      const TextSpan(text: 'Comented on '),
                      TextSpan(
                        text: feed.lastCommenter,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' and ${feed.otherCommentsCount} others'),
                    ],
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () => controller.onSendMessage(feed.id),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE5B069)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFE5B069),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Divider(color: Colors.white.withValues(alpha: 0.08), height: 1.h),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: (20 * feed.companionAvatars.length + 10).w,
                  height: 30.h,
                  child: Stack(
                    children: List.generate(
                      feed.companionAvatars.length,
                          (i) => Positioned(
                        left: (i * 18).w,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF0A111E), width: 1.5.r),
                          ),
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundImage: NetworkImage(feed.companionAvatars[i]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '${feed.availableCompanionsCount} companions available',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF22C55E),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => controller.onAvailableTap(feed.id),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5B069),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Available',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF0A111E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}