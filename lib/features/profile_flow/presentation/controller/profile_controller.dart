import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Tab switching index (0: Seller Hub, 1: Account)
  int selectedTabIndex = 0;

  // Vacation Mode Switch State
  bool isVacationModeOn = false;

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  void toggleVacationMode(bool value) {
    isVacationModeOn = value;
    update();
  }
}