import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}