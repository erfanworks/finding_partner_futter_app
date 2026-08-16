import 'package:get/get.dart';

class SelectDateTimeController extends GetxController {
  var selectedDate = DateTime(2026, 9, 15).obs;
  var focusedMonth = DateTime(2026, 9, 1).obs;
  var selectedSlotIndex = 0.obs;
  var selectedTimezone = 'UTC +2'.obs;
  var selectedTime = '16:40/ 4:40 PM'.obs;
  var selectedDuration = '2 Hrs'.obs;

  final List<String> timezones = ['UTC +1', 'UTC +2', 'UTC +3', 'UTC +6'];
  final List<String> times = ['12:00 PM', '02:30 PM', '16:40/ 4:40 PM', '06:00 PM'];
  final List<String> durations = ['1 Hr', '2 Hrs', '3 Hrs', '4 Hrs'];

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void changeSlot(int index) {
    selectedSlotIndex.value = index;
  }
}