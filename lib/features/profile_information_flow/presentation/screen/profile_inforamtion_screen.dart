import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/profile_information_controller.dart';


class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileInformationController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A111E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeaderSection(controller),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('NICKNAME'),
                  SizedBox(height: 6.h),
                  _buildInputField(controller.nicknameController),
                  SizedBox(height: 16.h),

                  _buildLabel('GENDER'),
                  SizedBox(height: 6.h),
                  _buildInputField(controller.genderController),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('COUNTRY'),
                            SizedBox(height: 6.h),
                            _buildInputField(controller.countryController),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('CITY'),
                            SizedBox(height: 6.h),
                            _buildInputField(controller.cityController),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  _buildLabel('LOCATION'),
                  SizedBox(height: 6.h),
                  _buildInputField(controller.locationController),
                  SizedBox(height: 20.h),
                  _buildLabel('COLLECTION'),
                  SizedBox(height: 10.h),
                  _buildCollectionList(controller),
                  SizedBox(height: 20.h),
                  _buildLabel('BIO'),
                  SizedBox(height: 6.h),
                  _buildInputField(controller.bioController, maxLines: 4),
                  SizedBox(height: 20.h),
                  _buildLabel('INTERESTS'),
                  SizedBox(height: 10.h),
                  _buildInterestsWrap(controller),
                  SizedBox(height: 20.h),
                  _buildLabel('LANGUAGES'),
                  SizedBox(height: 10.h),
                  _buildLanguagesWrap(controller),
                  SizedBox(height: 32.h),
                  ElevatedButton(
                    onPressed: controller.onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE5B069),
                      minimumSize: Size(double.infinity, 48.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF0A111E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildHeaderSection(ProfileInformationController controller) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Image.network(
                  controller.coverImageUrl,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 18.r,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 16.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 14.r,
                    child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 14.r),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Text(
              controller.username,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.genderSubText,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFE2E8F0),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  controller.ageSubText,
                  style: GoogleFonts.dmSans(
                      color: const Color(0xFFE2E8F0),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 150.h,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0A111E), width: 3.r),
                ),
                child: CircleAvatar(
                  radius: 42.r,
                  backgroundImage: NetworkImage(controller.profileImageUrl),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF151F30),
                  radius: 13.r,
                  child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 13.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildLabel(String title) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        color: const Color(0xFF8C8D94),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildInputField(TextEditingController textController, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151F30),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: TextField(
        controller: textController,
        maxLines: maxLines,
        style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: maxLines > 1 ? 12.h : 0.h),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCollectionList(ProfileInformationController controller) {
    return SizedBox(
      height: 100.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          ...controller.collections.map((item) => Container(
            width: 120.w,
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              image: DecorationImage(
                image: NetworkImage(item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(8.r),
            child: Text(
              item.title,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                shadows: [const Shadow(color: Colors.black, blurRadius: 4)],
              ),
            ),
          )),
          GestureDetector(
            onTap: controller.onAddCollection,
            child: Container(
              width: 70.w,
              decoration: BoxDecoration(
                color: const Color(0xFF151F30),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_rounded, color: const Color(0xFF8C9BAE), size: 22.r),
                  SizedBox(height: 4.h),
                  Text(
                    'Add New',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF8C9BAE),
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildInterestsWrap(ProfileInformationController controller) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.interests
                .map(
                  (item) => Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF151F30),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Text(
                  item,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ),
        CircleAvatar(
          backgroundColor: const Color(0xFF151F30),
          radius: 16.r,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.edit_outlined, color: Colors.white70, size: 14.r),
            onPressed: controller.onEditInterests,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguagesWrap(ProfileInformationController controller) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.languages
                .map(
                  (item) => Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF151F30),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.language,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      item.proficiency,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF4ADE80),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ),
        CircleAvatar(
          backgroundColor: const Color(0xFF151F30),
          radius: 16.r,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.edit_outlined, color: Colors.white70, size: 14.r),
            onPressed: controller.onEditLanguages,
          ),
        ),
      ],
    );
  }
}