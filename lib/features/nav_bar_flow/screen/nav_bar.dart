import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/navbar_controller.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    const backgroundColor = Color(0xFF182232);
    const topBorderColor = Color(0xFF222E40);
    const activeColor = Color(0xFFF1D199);
    const inactiveColor = Color(0xFF98A5B3);

    final List<NavItemData> items = [
      NavItemData(
        label: 'Home',
        activeIcon: Icons.home_rounded,
        inactiveIcon: Icons.home_outlined,
      ),
      NavItemData(
        label: 'Explore',
        activeIcon: Icons.explore_rounded,
        inactiveIcon: Icons.explore_outlined,
      ),
      NavItemData(
        label: 'Favorite',
        activeIcon: Icons.favorite_rounded,
        inactiveIcon: Icons.favorite_border_rounded,
      ),
      NavItemData(
        label: 'Profile',
        activeIcon: Icons.person_rounded,
        inactiveIcon: Icons.person_outline_rounded,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: topBorderColor,
            width: 1.0,
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
                        Icon(
                          isSelected ? item.activeIcon : item.inactiveIcon,
                          color: isSelected ? activeColor : inactiveColor,
                          size: 24.r,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          item.label,
                          style: GoogleFonts.dmSans(
                            color: isSelected ? activeColor : inactiveColor,
                            fontSize: 12.sp,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
  final IconData activeIcon;
  final IconData inactiveIcon;

  NavItemData({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}