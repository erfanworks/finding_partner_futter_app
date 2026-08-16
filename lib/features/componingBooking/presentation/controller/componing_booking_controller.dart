import 'package:get/get.dart';

class CompanionBookingsController extends GetxController {
  // selectedTab -> 0: Outstanding, 1: Confirmed, 2: Completed, 3: Declined
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  final List<Map<String, String>> bookingList = [
    {
      "day": "Fri",
      "date": "29",
      "name": "jhondoe, 29",
      "time": "4:00pm • 2hr",
      "amount": "\$120.50",
      "image": "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
    },
    {
      "day": "Fri",
      "date": "29",
      "name": "jhondoe, 29",
      "time": "4:00pm • 2hr",
      "amount": "\$120.50",
      "image": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
    },
    {
      "day": "Fri",
      "date": "29",
      "name": "jhondoe, 29",
      "time": "4:00pm • 2hr",
      "amount": "\$120.50",
      "image": "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
    },
    {
      "day": "Fri",
      "date": "29",
      "name": "jhondoe, 29",
      "time": "4:00pm • 2hr",
      "amount": "\$120.50",
      "image": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d",
    },
  ];
}