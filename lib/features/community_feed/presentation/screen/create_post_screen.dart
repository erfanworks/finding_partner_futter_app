import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controller/create_post_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController());

    return Scaffold(
      backgroundColor: const Color(0xFF0D141E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Create Post',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: const Color(0xFF162232),
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Row(
                          children: [
                            _buildTabButton(
                              title: 'NOW',
                              isSelected:
                                  controller.postType.value == PostType.now,
                              onTap: () => controller.setPostType(PostType.now),
                            ),
                            _buildTabButton(
                              title: 'SCHEDULED',
                              isSelected:
                                  controller.postType.value ==
                                  PostType.scheduled,
                              onTap: () =>
                                  controller.setPostType(PostType.scheduled),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildSectionLabel('SUBJECT'),
                    SizedBox(height: 8.h),
                    Obx(
                      () => _buildTextField(
                        controller: controller.subjectController,
                        hintText: controller.postType.value == PostType.now
                            ? 'Title - What are you looking for?'
                            : 'city or country',
                        prefixIcon:
                            controller.postType.value == PostType.scheduled
                            ? const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF7E8B9B),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildSectionLabel('DESCRIPTION'),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: controller.descriptionController,
                      hintText:
                          'Looking for a fitness partner for a morning run in Central Park. Pace 5:30/km.',
                      maxLines: 4,
                    ),
                    SizedBox(height: 20.h),
                    _buildSectionLabel('INTERESTS'),
                    SizedBox(height: 10.h),
                    Obx(
                      () => Row(
                        children: controller.interests.map((item) {
                          final isSelected =
                              controller.selectedInterest.value == item['name'];
                          return GestureDetector(
                            onTap: () =>
                                controller.selectInterest(item['name']!),
                            child: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF162232),
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFE5BA73)
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item['icon']!,
                                    height: 14.sp,
                                    width: 14.sp,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    item['name']!,
                                    style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(() {
                      if (controller.postType.value == PostType.scheduled) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionLabel('SELECT DATE'),
                            SizedBox(height: 8.h),
                            GestureDetector(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030),
                                );
                                if (date != null)
                                  controller.selectedDate.value = date;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF162232),
                                  borderRadius: BorderRadius.circular(28.r),
                                  border: Border.all(color: Colors.white10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.selectedDate.value != null
                                          ? DateFormat('dd MMMM, yyyy').format(
                                              controller.selectedDate.value!,
                                            )
                                          : '14 September, 2026',
                                      style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xFF7E8B9B),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                    _buildSectionLabel('LOCATION'),
                    SizedBox(height: 8.h),
                    Obx(
                      () => _buildTextField(
                        controller: controller.locationController,
                        hintText: controller.postType.value == PostType.now
                            ? 'City, Country'
                            : 'Miami',
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF7E8B9B),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.cleanCriminalRecord.value,
                            onChanged: controller.toggleCriminalRecord,
                            activeColor: const Color(0xFFE5BA73),
                            checkColor: Colors.black,
                            side: const BorderSide(
                              color: Color(0xFF7E8B9B),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Text(
                              'Only with clean criminal record',
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        _buildCriminalRecordBadge(),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    Container(
                      padding: EdgeInsets.all(14.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFF282D33),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: const Color(0xFFE5BA73),
                            size: 18.r,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              'A clean criminal record means no criminal convictions on file — verified through an official certificate.',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFFE6E6E8),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),


                    _buildSectionLabel('GENDER'),
                    SizedBox(height: 12.h),
                    Obx(
                      () => Row(
                        children: ['All', 'Male', 'Female'].map((gender) {
                          final isSelected =
                              controller.selectedGender.value == gender;
                          return GestureDetector(
                            onTap: () => controller.setGender(gender),
                            child: Padding(
                              padding: EdgeInsets.only(right: 28.w),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20.r,
                                    height: 20.r,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFFE5BA73)
                                            : const Color(0xFF7E8B9B),
                                        width: 2,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Center(
                                            child: Container(
                                              width: 10.r,
                                              height: 10.r,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFE5BA73),
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    gender,
                                    style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // ১০. IMAGE (Optional) Upload Area
                    _buildSectionLabel('IMAGE (Optional)'),
                    SizedBox(height: 10.h),
                    Container(
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF162232),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: Colors.white,
                              size: 26.r,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Upload Image',
                            style: GoogleFonts.dmSans(
                              color: const Color(0xFF7E8B9B),
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1D199),
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Center(
                    child: Text(
                      'Post',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF1E160D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF1D199) : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                color: isSelected ? const Color(0xFF1E160D) : Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.dmSans(
        color: const Color(0xFFB2B2B7),
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    Widget? prefixIcon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: maxLines > 1 ? 12.h : 2.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF162232),
        borderRadius: BorderRadius.circular(maxLines > 1 ? 16.r : 28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.dmSans(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(
            color: const Color(0xFFE6E6E8),
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildCriminalRecordBadge() {
    return Column(
      children: [
       Image.asset(AppImages.criminalImage,height: 50.h,width: 50.w),
        SizedBox(height: 2.h),
        Text(
          'CLEAN CRIMINAL\nRECORD',
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(
            color: const Color(0xFFEDC286),
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
