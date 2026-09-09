import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/member_ship_controller.dart';


class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D131E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Membership',
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MembershipController>(
        init: MembershipController(),
        builder: (controller) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.plans.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final plan = controller.plans[index];
              return GestureDetector(
                onTap: () => controller.selectPlan(index),
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: plan.isHighlighted
                        ? const Color(0xFFE8B878).withValues(alpha: 0.1)
                        : const Color(0xFF162232),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: plan.isHighlighted
                          ? const Color(0xFFE8B878)
                          : Colors.white.withValues(alpha: 0.05),
                      width: plan.isHighlighted ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            children: [
                              Text(
                                plan.title,
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (plan.iconEmoji != null) ...[
                                SizedBox(width: 6.w),
                                Text(
                                  plan.iconEmoji!,
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ],
                          ),
                          if (plan.price != null)
                            RichText(
                              text: TextSpan(
                                text: plan.price,
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ${plan.period}',
                                    style: GoogleFonts.dmSans(
                                      color: const Color(0xFF8FA1B5),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Feature List
                      ...plan.features.map(
                        (feature) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                color: const Color(0xFFE8B878),
                                size: 18.r,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  feature.text,
                                  style: GoogleFonts.dmSans(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 12.sp,
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Buy Now Button
                      if (plan.hasBuyButton) ...[
                        SizedBox(height: 8.h),
                        Container(
                          width: double.infinity,
                          height: 48.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: const Color(0xFFE5B069),
                          ),
                          child: ElevatedButton(
                            onPressed: () => controller.onBuyPlan(plan),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Buy Now',
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFF0A111E),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}