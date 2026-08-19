import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        activeIcon: Icons.home_rounded,
        inactiveIcon: Icons.home_outlined,
      ),
      NavItemData(
        label: 'message',
        activeIcon: Icons.messenger_outline_outlined,
        inactiveIcon: Icons.messenger_outline,
      ),
      NavItemData(
        label: 'shop',
        activeIcon: Icons.shop_sharp,
        inactiveIcon: Icons.shop_sharp,
      ),
      NavItemData(
        label: 'Explore',
        activeIcon: Icons.explore_rounded,
        inactiveIcon: Icons.explore_outlined,
      ),
      NavItemData(
        label: 'Profile',
        activeIcon: Icons.person_rounded,
        inactiveIcon: Icons.person_outline_rounded,
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
                        Icon(
                          isSelected ? item.activeIcon : item.inactiveIcon,
                          color: isSelected ? activeColor : inactiveColor,
                          size: 28.r,
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
  final IconData activeIcon;
  final IconData inactiveIcon;

  NavItemData({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}