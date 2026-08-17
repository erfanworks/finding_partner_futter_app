import 'package:get/get.dart';

class AvailabilityController extends GetxController {
  // Tab Toggle ('NOW' / 'SCHEDULED')
  String selectedTab = 'NOW';

  // Selected Dates in Calendar
  DateTime currentMonth = DateTime(2026, 9, 1);
  List<int> selectedDates = [15, 21];

  // Time States
  String startTime = '24:00/ 12PM';
  String endTime = '24:00/ 12PM';

  // Options Switches
  bool isFullDaysAvailable = false;
  bool isEnableRequestOption = true;

  void setTab(String tab) {
    selectedTab = tab;
    update();
  }

  void toggleDate(int day) {
    if (selectedDates.contains(day)) {
      selectedDates.remove(day);
    } else {
      selectedDates.add(day);
    }
    update();
  }

  void toggleFullDays(bool value) {
    isFullDaysAvailable = value;
    update();
  }

  void toggleEnableRequest(bool value) {
    isEnableRequestOption = value;
    update();
  }

  void saveChanges() {
    // Save availability API logic
    Get.back();
  }
}