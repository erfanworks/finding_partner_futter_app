import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/my_booking_controller.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyBookingsController controller = Get.put(MyBookingsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "My Bookings",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              _buildTabBar(controller),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(() {
                  if (controller.selectedTab.value == 0) {
                    return _buildBookingList(controller.upcomingBookings);
                  } else {
                    return Center(
                      child: Text(
                        "No data found",
                        style: GoogleFonts.dmSans(
                          color: Colors.white54,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTabBar(MyBookingsController controller) {
    List<String> tabs = ["Upcoming", "Completed", "Canceled"];

    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2A),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1.w,
        ),
      ),
      child: Obx(
            () => Row(
          children: List.generate(tabs.length, (index) {
            bool isSelected = controller.selectedTab.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                      colors: [Color(0xFFE2B777), Color(0xFFB38038)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                        : null,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: GoogleFonts.dmSans(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF8C8D94),
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
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
  Widget _buildBookingList(List<Map<String, String>> bookings) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final item = bookings[index];
        return Container(
          margin: EdgeInsets.only(bottom: 14.h),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: const Color(0xFF131C2E),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: const Color(0xFF232E42),
              width: 1.w,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: NetworkImage(item["image"]!),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"]!,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item["category"]!,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8C8D94),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                item["status"]!,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFEDC286),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 6.w),
            ],
          ),
        );
      },
    );
  }
}