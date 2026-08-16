import 'package:get/get.dart';

class BookingModel {
  final String day;
  final String date;
  final String name;
  final String time;
  final String duration;
  final String price;
  final String avatarUrl;

  BookingModel({
    required this.day,
    required this.date,
    required this.name,
    required this.time,
    required this.duration,
    required this.price,
    required this.avatarUrl,
  });
}

class BookingHistoryController extends GetxController {
  String selectedFilter = 'Confirmed';

  final List<String> filterCategories = [
    'Outstanding',
    'Confirmed',
    'Completed',
    'Declined',
  ];

  void selectFilter(String filter) {
    selectedFilter = filter;
    update();
  }

  final List<BookingModel> bookingList = [
    BookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm',
      duration: '2hr',
      price: '\$120.50',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    ),
    BookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm',
      duration: '2hr',
      price: '\$120.50',
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    ),
    BookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm',
      duration: '2hr',
      price: '\$120.50',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    ),
    BookingModel(
      day: 'Fri',
      date: '29',
      name: 'jhondoe, 29',
      time: '4:00pm',
      duration: '2hr',
      price: '\$120.50',
      avatarUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400&auto=format&fit=crop',
    ),
  ];
}