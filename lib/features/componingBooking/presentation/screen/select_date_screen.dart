import 'package:amychebbi/core/constants/app_color.dart';
import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/SelectDateTimeController.dart';


class SelectDateTimeScreen extends GetView<SelectDateTimeController> {
  const SelectDateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectDateTimeController());

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.appBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Select date & time',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('SELECT DATE'),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFF131F2C),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                        () => Text(
                      '${controller.selectedDate.value.day} September, ${controller.selectedDate.value.year}',
                      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                    height: 18.h,
                    width: 18.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFF131F2C),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 16),
                      Text(
                        'September, 2026',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                        .map((day) => Text(
                      day,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 11.sp,
                      ),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 35,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      int dayNumber = index - 4;
                      if (dayNumber <= 0 || dayNumber > 30) {
                        return const SizedBox.shrink();
                      }
                      return Obx(() {
                        bool isSelected = controller.selectedDate.value.day == dayNumber;
                        return GestureDetector(
                          onTap: () => controller.selectDate(DateTime(2026, 9, dayNumber)),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? const Color(0xFFECC27D)
                                  : const Color(0xFF0C1929),
                            ),
                            child: Center(
                              child: Text(
                                '$dayNumber',
                                style: GoogleFonts.dmSans(
                                  color: isSelected ? Colors.black : Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            _buildSectionHeader('SELECT TIME SLOT'),
            SizedBox(height: 10.h),

            _buildSlotCard(title: 'Slot 1', timeRange: '12:00-16:00', duration: '2 Hrs', slotIndex: 0),
            SizedBox(height: 10.h),
            _buildSlotCard(title: 'Slot 2', timeRange: '12:00-16:00', duration: '2 Hrs', slotIndex: 1),
            SizedBox(height: 20.h),
            _buildSectionHeader('SELECT TIMEZONE'),
            SizedBox(height: 8.h),
            Obx(() => _buildDropdown(
              value: controller.selectedTimezone.value,
              items: controller.timezones,
              onChanged: (val) => controller.selectedTimezone.value = val!,
            )),
            SizedBox(height: 16.h),
            _buildSectionHeader('SELECT TIME'),
            SizedBox(height: 8.h),
            Obx(() => _buildDropdown(
              value: controller.selectedTime.value,
              items: controller.times,
              onChanged: (val) => controller.selectedTime.value = val!,
            )),
            SizedBox(height: 16.h),
            _buildSectionHeader('SELECT DURATION'),
            SizedBox(height: 8.h),
            Obx(() => _buildDropdown(
              value: controller.selectedDuration.value,
              items: controller.durations,
              onChanged: (val) => controller.selectedDuration.value = val!,
            )),
            SizedBox(height: 28.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.reviewBookingScreen);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF0CA93), Color(0xFFDCB172)],
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF1A120B),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: Color(0xFFE6E6E8),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSlotCard({
    required String title,
    required String timeRange,
    required String duration,
    required int slotIndex,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedSlotIndex.value == slotIndex;
      return GestureDetector(
        onTap: () => controller.changeSlot(slotIndex),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEDC286).withAlpha(60) : const Color(0xFF131F2C),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: isSelected ? const Color(0xFFEDC286) : Colors.white.withAlpha(80),
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                timeRange,
                style: GoogleFonts.dmSans(
                  color: Colors.white.withAlpha(130),
                  fontSize: 16.sp,
                ),
              ),
              Text(
                duration,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFECC27D),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFF131F2C),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF131F2C),
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 16.sp,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}