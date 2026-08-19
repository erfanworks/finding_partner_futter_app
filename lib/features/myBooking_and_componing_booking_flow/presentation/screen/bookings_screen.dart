import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/bookings_controller.dart';



class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingsController controller = Get.put(BookingsController());

    return Scaffold(
      backgroundColor: const Color(0xFF0B1522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1522),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Bookings',
          style: GoogleFonts.sansita(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          _buildTopTabBar(controller),
          SizedBox(height: 20.h),
          _buildSubTabFilter(controller),
          SizedBox(height: 20.h),
          Expanded(
            child: Obx(() {
              bool isMyBooking = controller.selectedMainTab.value == 0;
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: isMyBooking
                    ? controller.myBookingsList.length
                    : controller.companionBookingsList.length,
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemBuilder: (context, index) {
                  if (isMyBooking) {
                    return _buildMyBookingCard(controller.myBookingsList[index]);
                  } else {
                    return _buildCompanionCard(controller.companionBookingsList[index]);
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }


  Widget _buildTopTabBar(BookingsController controller) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF1E293B), width: 1)),
      ),
      child: Row(
        children: [
          _mainTabItem(controller, title: 'My Booking', index: 0),
          _mainTabItem(controller, title: 'Companion Booking', index: 1),
        ],
      ),
    );
  }

  Widget _mainTabItem(BookingsController controller, {required String title, required int index}) {
    return Expanded(
      child: Obx(() {
        bool isSelected = controller.selectedMainTab.value == index;
        return GestureDetector(
          onTap: () => controller.changeMainTab(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? const Color(0xFFDCA452) : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: isSelected ? const Color(0xFFDCA452) : const Color(0xFF8E9BAE),
                fontSize: 15.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        );
      }),
    );
  }

  // Sub Tab Chips Slider
  Widget _buildSubTabFilter(BookingsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: const Color(0xFF131F30),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: const Color(0xFF1E2D42), width: 1),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            bool isMyBooking = controller.selectedMainTab.value == 0;
            List<String> currentTabs = isMyBooking
                ? controller.myBookingSubTabs
                : controller.companionSubTabs;
            int currentSelectedIndex = isMyBooking
                ? controller.selectedMyBookingFilter.value
                : controller.selectedCompanionFilter.value;

            return Row(
              children: List.generate(currentTabs.length, (index) {
                bool isSelected = currentSelectedIndex == index;
                return GestureDetector(
                  onTap: () => controller.changeSubFilter(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      gradient: isSelected
                          ? const LinearGradient(
                        colors: [Color(0xFFE2B46A), Color(0xFFB8823A)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                          : null,
                    ),
                    child: Text(
                      currentTabs[index],
                      style: GoogleFonts.dmSans(
                        color: isSelected ? Colors.white : const Color(0xFF7E8B9B),
                        fontSize: 13.sp,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }

  // My Booking Design Item
  Widget _buildMyBookingCard(MyBookingModel item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFF131F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF1D2E45), width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(item.image, width: 52.w, height: 52.h, fit: BoxFit.cover),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text(
                  item.category,
                  style: GoogleFonts.dmSans(color: const Color(0xFF8E9BAE), fontSize: 13.sp),
                ),
              ],
            ),
          ),
          Text(
            item.status,
            style: GoogleFonts.dmSans(color: const Color(0xFFDCA452), fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Companion Booking Design Item
  Widget _buildCompanionCard(CompanionBookingModel item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF131F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF1D2E45), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: const Color(0xFF7E5C29), width: 1.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.day,
                  style: GoogleFonts.dmSans(color: const Color(0xFFDCA452), fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  item.date,
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(item.image, width: 50.w, height: 50.h, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text(
                  item.time,
                  style: GoogleFonts.dmSans(color: const Color(0xFF6C7A8E), fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Text(
            item.price,
            style: GoogleFonts.dmSans(color: const Color(0xFFDCA452), fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}