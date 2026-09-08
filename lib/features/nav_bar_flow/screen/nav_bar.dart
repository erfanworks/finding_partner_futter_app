import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/navbar_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.selectedIndex.value = selectedIndex;
    });

    const backgroundColor = Color(0xFF1E293B);
    const topBorderColor = Color(0xFF383945);
    const activeColor = Color(0xFFEDC286);
    const inactiveColor = Color(0xFFE6E6E8);

    final List<NavItemData> items = [
      NavItemData(
        label: 'Home',
        activeIcon: 'assets/icons/home_fill_icon.svg',
        inactiveIcon: 'assets/icons/home_icon.svg',
      ),
      NavItemData(
        label: 'Explore',
        activeIcon: 'assets/icons/discover_fill_icon.svg',
        inactiveIcon: 'assets/icons/explore_icon.svg',
      ),
      NavItemData(
        label: 'Message',
        activeIcon: 'assets/icons/message_fill_icon.svg',
        inactiveIcon: 'assets/icons/messege_icon.svg',
      ),
      NavItemData(
        label: 'Profile',
        activeIcon: 'assets/icons/profile_fill_icon.svg',
        inactiveIcon: 'assets/icons/profile_icon_unfill.svg',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: topBorderColor,
            width: 2.0.w,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final isSelected = controller.selectedIndex.value == index;
                final item = items[index];

                return Expanded(
                  child: InkWell(
                    onTap: () => controller.changeIndex(index),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          isSelected ? item.activeIcon : item.inactiveIcon,
                          colorFilter: ColorFilter.mode(
                            isSelected ? activeColor : inactiveColor,
                            BlendMode.srcIn,
                          ),
                          height: 28.r,
                          width: 28.r,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          item.label,
                          style: GoogleFonts.dmSans(
                            color: isSelected ? activeColor : inactiveColor,
                            fontSize: 14.sp,
                            fontWeight: isSelected ? FontWeight.w400 : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItemData {
  final String label;
  final String activeIcon;
  final String inactiveIcon;

  NavItemData({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}
