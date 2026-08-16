import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../nav_bar_flow/screen/nav_bar.dart';
import '../controller/favourite_controller.dart';


class FavoriteCompanionsScreen extends StatelessWidget {
  const FavoriteCompanionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D131E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Favorite Companions',
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
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
      body: GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (controller) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.63,
            ),
            itemCount: controller.favorites.length,
            itemBuilder: (context, index) {
              final item = controller.favorites[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFF162232),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.2),
                                Colors.black.withValues(alpha: 0.95),
                              ],
                              stops: const [0.3, 0.6, 1.0],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: GestureDetector(
                          onTap: () => controller.toggleFavorite(index),
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: item.isFavorite
                                  ? const Color(0xFFFF4B4B)
                                  : Colors.white,
                              size: 18.r,
                            ),
                          ),
                        ),
                      ),

                      // নিচের টেক্সট এবং বাটন কন্টেন্ট
                      Positioned(
                        left: 10.w,
                        right: 10.w,
                        bottom: 10.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.name,
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '${item.category}  •  ${item.location}',
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFEDC286),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Times Booked: ${item.timesBooked}',
                              style: GoogleFonts.dmSans(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'Last Booking: ${item.lastBooking}',
                              style: GoogleFonts.dmSans(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: double.infinity,
                              height: 33.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFEDC286),
                                    Color(0xFFB4833F),
                                  ],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Send Message',
                                  style: GoogleFonts.dmSans(
                                    color: Color(0xFF383945),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}