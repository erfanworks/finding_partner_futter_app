import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/avater_controller.dart';


class AvatarFramesScreen extends StatelessWidget {
  const AvatarFramesScreen({super.key});

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
          'Avatar Frames',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Top Right Golden Coin Badge
          GetBuilder<AvatarFramesController>(
            init: AvatarFramesController(),
            builder: (controller) => Center(
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                height: 30.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF282D33),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFFEDC286), width: 1.2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.japansCoin,
                      height: 34.h,
                      width: 32.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 12.w),
                      child: Text(
                        controller.totalCoins,
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFFEDC286),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<AvatarFramesController>(
        init: AvatarFramesController(),
        builder: (controller) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: controller.frameList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              final frame = controller.frameList[index];
              return _buildFrameCard(frame, controller);
            },
          );
        },
      ),
    );
  }

  // Single Frame Card Component
  Widget _buildFrameCard(AvatarFrameModel frame, AvatarFramesController controller) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 4.h),
          // Circular Avatar with Gradient Frame Border
          Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: frame.borderColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              radius: 40.r,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
              ),
            ),
          ),

          // Title & Status / Price Row
          Column(
            children: [
              Text(
                frame.title,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              if (frame.isOwned)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D4B3E),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.5)),
                  ),
                  child: Text(
                    'Owned',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF22C55E),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 6.r,
                      backgroundColor: const Color(0xFFE5B069),
                      child: Text('生', style: TextStyle(fontSize: 6.sp, color: Colors.black)),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      frame.price,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8C9BAE),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Action Button (Unlock vs Use in Profile)
          if (frame.isOwned)
            ElevatedButton(
              onPressed: () => controller.onUseInProfile(frame),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E3275),
                minimumSize: Size(double.infinity, 38.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Use in Profile',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            ElevatedButton(
              onPressed: () => controller.onUnlock(frame),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5B069),
                minimumSize: Size(double.infinity, 38.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Unlock',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF0A111E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}