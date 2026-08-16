import 'package:get/get.dart';

class CommunityFeedController extends GetxController {
  // 0: NOW, 1: SCHEDULED
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}