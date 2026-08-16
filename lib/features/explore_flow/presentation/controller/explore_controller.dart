import 'package:get/get.dart';

class ProfileModel {
  final String name;
  final String category;
  final String location;
  final String rating;
  final String reviews;
  final String price;
  final String coinText;
  final String image;
  bool isFavorite;

  ProfileModel({
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.coinText,
    required this.image,
    this.isFavorite = false,
  });
}

class ExploreController extends GetxController {
  // .obs তুলে সাধারণ String দিন
  String selectedCategory = 'All';

  // .obs তুলে সাধারণ List দিন
  final List<String> categories = [
    'All',
    'Travel',
    'Gaming',
    'Social',
    'Networking',
  ];

  void selectCategory(String category) {
    selectedCategory = category;
    update(); // GetBuilder রিফ্রেশ করার জন্য update() দরকার
  }

  final List<ProfileModel> profiles = [
    ProfileModel(
      name: 'natasharahman, 27',
      category: 'Gaming - playstation',
      location: 'Miami, USA',
      rating: '4.5',
      reviews: '128',
      price: '\$45/hr',
      coinText: '450 Seirus',
      image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    ),
    ProfileModel(
      name: 'natasharahman, 27',
      category: 'Gaming - playstation',
      location: 'Miami, USA',
      rating: '4.5',
      reviews: '128',
      price: '\$45/hr',
      coinText: '450 Seirus',
      image: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  void toggleFavorite(int index) {
    profiles[index].isFavorite = !profiles[index].isFavorite;
    update(); // UI আপডেট করার জন্য update() কল করুন
  }
}