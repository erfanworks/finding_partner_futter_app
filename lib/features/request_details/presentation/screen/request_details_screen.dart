import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/request_details_controller.dart';
import '../widget/accept_confirmating_dialog.dart';
import '../widget/declineConfirmationDialog.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RequestDetailsController());

    return Scaffold(
      backgroundColor: const Color(0xFF0D141E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 18.sp,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Request Details",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserProfileCard(),
              SizedBox(height: 14.h),
              _buildDetailsCard(),
              SizedBox(height: 20.h),
              Text(
                "Added Gifts & Badges",
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              _buildGiftsAndBadges(),
              SizedBox(height: 14.h),
              _buildSpecificRequestCard(),
              SizedBox(height: 24.h),
              _buildActionButtons(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileCard() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        border: Border.all(width: 2.w, color: Color(0xFF3D4754)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
              width: 80.r,
              height: 80.r,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "benjaminromano, 27",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Male  •  Florida",
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF8C9BAE),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                AppImages.criminalImage,
                height: 55.sp,
                width: 79.sp,
              ),
              SizedBox(height: 2.h),
              Text(
                "CLEAN CRIMINAL\nRECORD",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFD4AF37),
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(width: 1.5.w, color: Color(0xFF3D4754)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                _buildInfoRow("Selected Service", "Gaming"),
                _buildInfoRow("Date", "24 September, 2026"),
                _buildInfoRow("Time", "9:00PM"),
                _buildInfoRow("Duration", "2 hours"),
                _buildInfoRow("Location", "Florida, USA"),
                _buildInfoRow("Language", "English, Arabic"),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(width: 1.5.w, color: Color(0xFF3D4754)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                _buildInfoRow("Subtotal", "\$90.00"),
                _buildInfoRow("Tips", "\$5.00"),
                _buildInfoRow("Service Fee", "\$5.00"),
                _buildInfoRow("Taxes", "\$10.00"),
                SizedBox(height: 16.h),
                Divider(height: 1.5.h, color: Color(0xFF3D4754)),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFEDC286),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$45.00",
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFEDC286),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              color: Color(0xFFE6E6E8),
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftsAndBadges() {
    return Row(
      children: [
        Expanded(
          child: _buildBadgeTile(
            icon: Icons.military_tech_outlined,
            title: "Premium Frame",
            subtitle: "Frame",
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _buildBadgeTile(
            icon: Icons.workspace_premium_outlined,
            title: "Elite Supporter",
            subtitle: "Badge",
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFEDC286), size: 22.sp),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF8C9BAE),
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificRequestCard() {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141F2E),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Specific request",
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Seeking a travel companion for the upcoming tech expo in Tokyo. Expenses shared.",
            style: GoogleFonts.dmSans(
              color: Color(0xFFB2B2B7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            "PERSONALIZED OFFER",
            style: GoogleFonts.dmSans(
              color: Color(0xFFB2B2B7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF0D141E),
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                Text(
                  "\$",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: "Custom amount",
                      hintStyle: GoogleFonts.dmSans(
                        color: Color(0xFFB2B2B7),
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Color(0xFF0D141E),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Text(
              "Seeking a travel companion for the upcoming tech expo in Tokyo. Expenses shared.",
              style: GoogleFonts.dmSans(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  const DeclineConfirmationDialog(
                    name: 'mohammadshakil',
                    category: 'Travel',
                    dateTime: '02 october, 2PM',
                  ),
                  barrierDismissible: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A1E29).withValues(alpha: 0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "Decline",
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFFF5252),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  const AcceptConfirmationDialog(
                    name: 'mohammadshakil',
                    category: 'Travel',
                    dateTime: '02 october, 2PM',
                  ),
                  barrierDismissible: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E8E50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "Accept",
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
