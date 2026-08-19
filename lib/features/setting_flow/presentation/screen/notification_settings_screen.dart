import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/settings_controller.dart';


class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1522),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1522),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18.sp),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Notification Setting',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  _buildSwitchTile(
                    title: 'General Notification',
                    value: controller.isGeneralNotificationOn,
                    onChanged: (val) => controller.toggleGeneralNotification(val),
                  ),
                  SizedBox(height: 12.h),
                  _buildSwitchTile(
                    title: 'Sound',
                    value: controller.isSoundOn,
                    onChanged: (val) => controller.toggleSound(val),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.scale(
            scale: 0.85,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}