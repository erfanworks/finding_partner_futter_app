import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/service_controller.dart';


class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

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
          'Add Services',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ServicesController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Dropdown
                _buildLabel('SELECT CATEGORY'),
                SizedBox(height: 6.h),
                _buildDropdownField<String>(
                  value: controller.selectedCategory,
                  items: controller.categories,
                  onChanged: (val) {
                    if (val != null) controller.setCategory(val);
                  },
                ),
                SizedBox(height: 16.h),

                // SubService Dropdown
                _buildLabel('SELECT SERVICE'),
                SizedBox(height: 6.h),
                _buildDropdownField<String>(
                  value: controller.selectedSubService,
                  items: controller.subServices,
                  onChanged: (val) {
                    if (val != null) controller.setSubService(val);
                  },
                ),
                SizedBox(height: 16.h),

                // Price Field
                _buildLabel('PRICE'),
                SizedBox(height: 6.h),
                _buildInputField(controller.priceController),
                SizedBox(height: 20.h),

                // Upload Box
                _buildLabel('SERVICE IMAGE'),
                SizedBox(height: 8.h),
                _buildImageUploadBox(),
                SizedBox(height: 40.h),

                // Add Button
                ElevatedButton(
                  onPressed: controller.addService,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE5B069),
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Add',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF0A111E),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: const Color(0xFF8C8D94),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: const Color(0xFF8C9BAE), size: 22.r),
          dropdownColor: const Color(0xFF151F30),
          style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.w400),
          items: items
              .map((e) => DropdownMenuItem<T>(
            value: e,
            child: Text(e.toString()),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController textController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: TextField(
        controller: textController,
        style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildImageUploadBox() {
    return Container(
      width: double.infinity,
      height: 240.h,
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36.r,
            backgroundColor: Colors.white.withValues(alpha: 0.05),
            child: Icon(
              Icons.file_upload_outlined,
              color: Colors.white,
              size: 28.r,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Upload Image',
            style: GoogleFonts.dmSans(
              color: const Color(0xFF8C9BAE),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}