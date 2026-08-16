import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, String>> categories = const [
    {'title': 'Travel', 'emoji': '✈️'},
    {'title': 'Business', 'emoji': '💼'},
    {'title': 'Fitness', 'emoji': '🏋️'},
    {'title': 'Gaming', 'emoji': '🎮'},
    {'title': 'Activities', 'emoji': '🍿'},
    {'title': 'Networking', 'emoji': '☕'},
    {'title': 'Social Talking', 'emoji': '💬'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09121D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09121D),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Categories",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: (){
              Get.toNamed(
                AppRoutes.categorySearchScreen,
                arguments: category['title'],
              );
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF172232),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Text(
                      category['emoji']!,
                      style: TextStyle(fontSize: 22.sp),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        category['title']!,
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                )
                ),
          );
          },
      ),
    );
  }
}