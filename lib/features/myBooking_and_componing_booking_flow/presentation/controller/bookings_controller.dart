import 'package:get/get.dart';


class MyBookingModel {
  final String name;
  final String category;
  final String status;
  final String image;

  MyBookingModel({
    required this.name,
    required this.category,
    required this.status,
    required this.image,
  });
}

class CompanionBookingModel {
  final String day;
  final String date;
  final String name;
  final String time;
  final String price;
  final String image;

  CompanionBookingModel({
    required this.day,
    required this.date,
    required this.name,
    required this.time,
    required this.price,
    required this.image,
  });
}

class BookingsController extends GetxController {
  // Main Tab State: 0 = My Booking, 1 = Companion Booking
  var selectedMainTab = 0.obs;

  // Filter Tab States
  var selectedMyBookingFilter = 0.obs;
  var selectedCompanionFilter = 0.obs;

  final List<String> myBookingSubTabs = ['Upcoming', 'Completed', 'Canceled'];
  final List<String> companionSubTabs = ['Outstanding', 'Confirmed', 'Completed', 'Declined'];

  // Dummy List Data
  final RxList<MyBookingModel> myBookingsList = <MyBookingModel>[
    MyBookingModel(
      name: 'Natasha Romario, 27',
      category: 'Gaming',
      status: 'Upcoming',
      image: 'https://i.pravatar.cc/150?img=47',
    ),
    MyBookingModel(
      name: 'Ferbizo Romano, 35',
      category: 'Gaming',
      status: 'Upcoming',
      image: 'https://i.pravatar.cc/150?img=12',
    ),
    MyBookingModel(
      name: 'Tasha Romario, 22',
      category: 'Gaming',
      status: 'Upcoming',
      image: 'https://i.pravatar.cc/150?img=32',
    ),
    MyBookingModel(
      name: 'Jhon Doe, 29',
      category: 'Gaming',
      status: 'Upcoming',
      image: 'https://i.pravatar.cc/150?img=60',
    ),
  ].obs;

  final RxList<CompanionBookingModel> companionBookingsList = <CompanionBookingModel>[
    CompanionBookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm • 2hr',
      price: '\$120.50',
      image: 'https://i.pravatar.cc/150?img=68',
    ),
    CompanionBookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm • 2hr',
      price: '\$120.50',
      image: 'https://i.pravatar.cc/150?img=60',
    ),
    CompanionBookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm • 2hr',
      price: '\$120.50',
      image: 'https://i.pravatar.cc/150?img=49',
    ),
    CompanionBookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm • 2hr',
      price: '\$120.50',
      image: 'https://i.pravatar.cc/150?img=33',
    ),
  ].obs;

  void changeMainTab(int index) {
    selectedMainTab.value = index;
  }

  void changeSubFilter(int index) {
    if (selectedMainTab.value == 0) {
      selectedMyBookingFilter.value = index;
    } else {
      selectedCompanionFilter.value = index;
    }
  }
}