import 'package:get/get.dart';

class MyBookingsController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
  final List<Map<String, String>> upcomingBookings = [
    {
      "name": "Natasha Romario, 27",
      "category": "Gaming",
      "status": "Upcoming",
      "image": "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
    },
    {
      "name": "Ferbizo Romano, 35",
      "category": "Gaming",
      "status": "Upcoming",
      "image": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d",
    },
    {
      "name": "Tasha Romario, 22",
      "category": "Gaming",
      "status": "Upcoming",
      "image": "https://images.unsplash.com/photo-1517841905240-472988babdf9",
    },
    {
      "name": "Jhon Doe, 29",
      "category": "Gaming",
      "status": "Upcoming",
      "image": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
    },
  ];
}