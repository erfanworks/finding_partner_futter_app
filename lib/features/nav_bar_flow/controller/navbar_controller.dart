import 'package:get/get.dart';

import '../../../core/route/app_routes.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.offAllNamed(AppRoutes.homescreen);
        break;
      case 1:
        Get.toNamed(AppRoutes.exploreScreen);
        break;
      case 2:
        Get.toNamed(AppRoutes.messageListScreen);
        break;
      case 3:
        Get.toNamed(AppRoutes.profileScreen);
        break;
    }
  }
}
