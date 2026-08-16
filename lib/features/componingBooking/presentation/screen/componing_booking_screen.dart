import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/componing_booking_controller.dart';

class CompanionBookingsScreen extends StatelessWidget {
  const CompanionBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanionBookingsController controller =
    Get.put(CompanionBookingsController());

    return Scaffold(
      backgroundColor: const Color(0xFF0B131F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Companion Bookings",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            _buildTabBar(controller),
            SizedBox(height: 24.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() {
                  if (controller.selectedTab.value == 0) {
                    return _buildBookingList(controller.bookingList);
                  } else {
                    return Center(
                      child: Text(
                        "No Data Available",
                        style: GoogleFonts.dmSans(
                          color: Colors.white54,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTabBar(CompanionBookingsController controller) {
    List<String> tabs = ["Outstanding", "Confirmed", "Completed", "Declined"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(
            () => Row(
          children: List.generate(tabs.length, (index) {
            bool isSelected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                    colors: [Color(0xFFE2B777), Color(0xFFB38038)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                      : null,
                  color: isSelected ? null : const Color(0xFF131B2A),
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Colors.white.withValues(alpha: 0.08),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: GoogleFonts.dmSans(
                    color: isSelected ? Colors.white : const Color(0xFF8C8D94),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 14.sp,
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
              Container(
                width: 52.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xFFEDC286).withValues(alpha: 0.2),
                  border: Border.all(
                    color: Color(0xFFEDC286),
                    width: 1.w,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item["day"]!,
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFEDC286),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      item["date"]!,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              CircleAvatar(
                radius: 26.r,
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
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item["time"]!,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8C8D94),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                item["amount"]!,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFEDC286),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4.w),
            ],
          ),
        );
      },
    );
  }
}