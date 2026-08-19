import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/availabilityController.dart';


class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Availability',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AvailabilityController>(
        init: AvailabilityController(),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSegmentedTab(controller),
                SizedBox(height: 16.h),
                _buildCalendarCard(controller),
                SizedBox(height: 24.h),
                _buildTimeSelector('Start Time', controller.startTime),
                SizedBox(height: 12.h),
                Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),
                SizedBox(height: 16.h),
                _buildTimeSelector('End Time', controller.endTime),
                SizedBox(height: 24.h),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: const Color(0xFF0A111E), size: 20.r),
                      SizedBox(width: 6.w),
                      Text(
                        'Add another time slot',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF1E293B),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // 6. Options Section (Switches)
                Text(
                  'Options',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildOptionsBox(controller),
                SizedBox(height: 32.h),

                // 7. Save Changes Main Button
                ElevatedButton(
                  onPressed: controller.saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE5B069),
                    minimumSize: Size(double.infinity, 52.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Save Changes',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF0A111E),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          );
        },
      ),
    );
  }

  // Segmented Tab Component
  Widget _buildSegmentedTab(AvailabilityController controller) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.setTab('NOW'),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: controller.selectedTab == 'NOW'
                      ? const Color(0xFFE5B069)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'NOW',
                  style: GoogleFonts.dmSans(
                    color: controller.selectedTab == 'NOW'
                        ? const Color(0xFF0A111E)
                        : const Color(0xFF8C9BAE),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.setTab('SCHEDULED'),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: controller.selectedTab == 'SCHEDULED'
                      ? const Color(0xFFE5B069)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'SCHEDULED',
                  style: GoogleFonts.dmSans(
                    color: controller.selectedTab == 'SCHEDULED'
                        ? const Color(0xFF0A111E)
                        : const Color(0xFF8C9BAE),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCalendarCard(AvailabilityController controller) {
    final daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.white, size: 22.r),
                onPressed: () {},
              ),
              Text(
                'September, 2026',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white, size: 22.r),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek
                .map((day) => SizedBox(
              width: 32.w,
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 11.sp,
                ),
              ),
            ))
                .toList(),
          ),
          SizedBox(height: 8.h),
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
              const offset = 2;
              final dayNumber = index - offset + 1;

              if (index < offset || dayNumber > 30) {
                return const SizedBox.shrink();
              }

              final isSelected = controller.selectedDates.contains(dayNumber);
              final isSubSelected = [16, 17, 18, 19, 20].contains(dayNumber);

              Color bgColor = Colors.transparent;
              Color textColor = Colors.white;

              if (isSelected) {
                bgColor = const Color(0xFFE5B069);
                textColor = const Color(0xFF0A111E);
              } else if (isSubSelected) {
                bgColor = Colors.white.withValues(alpha: 0.1);
                textColor = Colors.white;
              }

              return GestureDetector(
                onTap: () => controller.toggleDate(dayNumber),
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$dayNumber',
                    style: GoogleFonts.dmSans(
                      color: textColor,
                      fontSize: 12.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelector(String label, String activeTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Text(
              '23:00',
              style: GoogleFonts.dmSans(
                color:  Color(0xFFC7C4D8),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE5B069),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                activeTime,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF383945),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              '01:00',
              style: GoogleFonts.dmSans(
                color: const Color(0xFFC7C4D8),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildOptionsBox(AvailabilityController controller) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full days available',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
                Switch(
                  value: controller.isFullDaysAvailable,
                  activeTrackColor: const Color(0xFFE5B069).withValues(alpha: 0.4),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0xFF2A364F),
                  onChanged: controller.toggleFullDays,
                ),
              ],
            ),
          ),
          Divider(color: Colors.white.withValues(alpha: 0.04), height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enable Request Option',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Allows booking on request for...',
                      style: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: controller.isEnableRequestOption,
                  activeTrackColor: const Color(0xFFE5B069),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0xFF2A364F),
                  onChanged: controller.toggleEnableRequest,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}