import 'package:get/get.dart';

class CompanionModel {
  final String name;
  final String category;
  final String location;
  final int timesBooked;
  final String lastBooking;
  final String image;
  bool isFavorite;

  CompanionModel({
    required this.name,
    required this.category,
    required this.location,
    required this.timesBooked,
    required this.lastBooking,
    required this.image,
    this.isFavorite = true,
  });
}

class FavoriteController extends GetxController {
  final List<CompanionModel> favorites = [
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    ),
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop',
    ),
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400&auto=format&fit=crop',
    ),
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=400&auto=format&fit=crop',
    ),
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    ),
    CompanionModel(
      name: 'natasharomario, 27',
      category: 'Gaming',
      location: 'Miami, USA',
      timesBooked: 5,
      lastBooking: '2 days ago',
      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  void toggleFavorite(int index) {
    favorites[index].isFavorite = !favorites[index].isFavorite;
    update();
  }
}