import 'package:amychebbi/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/categorie_search_controller.dart';


class CategorySearchScreen extends GetView<CategorySearchController> {
  const CategorySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategorySearchController());

    return Scaffold(
      backgroundColor: const Color(0xFF07121E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Obx(
              () => Text(
            controller.categoryTitle.value,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 12.h),

          SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected = controller.selectedCategoryIndex.value == index;
                  return GestureDetector(
                    onTap: () => controller.changeCategory(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? const LinearGradient(
                          colors: [Color(0xFFECC27D), Color(0xFFD39E53)],
                        )
                            : null,
                        color: isSelected ? null : const Color(0xFF162332),
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                      child: Center(
                        child: Text(
                          controller.categories[index],
                          style: GoogleFonts.dmSans(
                            color: isSelected ? Colors.black : const Color(0xFF8A95A5),
                            fontSize: 13.sp,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          SizedBox(height: 16.h),

          // ২. প্রোফাইল লিস্ট
          Expanded(
            child: Obx(
                  () => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                itemCount: controller.profileList.length,
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemBuilder: (context, index) {
                  final item = controller.profileList[index];
                  return _buildProfileCard(item, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(ProfileModel profile, int index) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF101C2B),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              profile.imageUrl,
              width: 111.w,
              height: 109.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${profile.name}, ${profile.age}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Image.asset(
                            AppImages.starCompenionImg,
                            height: 16,
                            width: 18,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.toggleFavorite(index),
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            profile.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                            color: profile.isFavorite.value ? Colors.redAccent : const Color(0xFF8A95A5),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  '${profile.category}  •  ${profile.location}',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF8A95A5),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFB85701), size: 16),
                    SizedBox(width: 4.w),
                    Text(
                      '${profile.rating}',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFDA7113),
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${profile.reviewCount})',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF8A95A5),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${profile.hourlyRate.toInt()}/hr',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFFEDC286),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'or ',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFF8A95A5),
                                fontSize: 10.sp,
                              ),
                            ),
                            Image.asset(
                              AppImages.japansCoin,
                              height: 11,
                              width: 11,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              '${profile.seirusPoints} Seirus',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFF8A95A5),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFECC27D),
                            Color(0xFFBD8E48),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'Send Message',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF1A120B),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}