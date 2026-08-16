import 'package:get/get.dart';

class ProfileModel {
  final String name;
  final int age;
  final String category;
  final String location;
  final double rating;
  final int reviewCount;
  final double hourlyRate;
  final int seirusPoints;
  final String imageUrl;
  var isFavorite = false.obs;

  ProfileModel({
    required this.name,
    required this.age,
    required this.category,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.hourlyRate,
    required this.seirusPoints,
    required this.imageUrl,
    bool isFavorite = false,
  }) {
    this.isFavorite.value = isFavorite;
  }
}

class CategorySearchController extends GetxController {
  var selectedCategoryIndex = 0.obs;
  var categoryTitle = 'Category'.obs;



  final List<String> categories = ['All', 'Available', 'Top rated', 'Near you'];
  var profileList = <ProfileModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      categoryTitle.value = Get.arguments.toString();
    }
    loadProfiles();
  }

  void changeCategory(int index) => selectedCategoryIndex.value = index;
  void toggleFavorite(int index) => profileList[index].isFavorite.toggle();

  void loadProfiles() {
    profileList.assignAll([
      ProfileModel(
        name: 'natasharahman',
        age: 27,
        category: 'Gaming – playstation',
        location: 'Miami, USA',
        rating: 4.5,
        reviewCount: 128,
        hourlyRate: 45,
        seirusPoints: 450,
        imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      ),
      ProfileModel(
        name: 'natasharahman',
        age: 27,
        category: 'Gaming – playstation',
        location: 'Miami, USA',
        rating: 4.5,
        reviewCount: 128,
        hourlyRate: 45,
        seirusPoints: 450,
        imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      ),
      ProfileModel(
        name: 'natasharahman',
        age: 27,
        category: 'Gaming – playstation',
        location: 'Miami, USA',
        rating: 4.5,
        reviewCount: 128,
        hourlyRate: 45,
        seirusPoints: 450,
        imageUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
      ),
      ProfileModel(
        name: 'natasharahman',
        age: 27,
        category: 'Gaming – playstation',
        location: 'Miami, USA',
        rating: 4.5,
        reviewCount: 128,
        hourlyRate: 45,
        seirusPoints: 450,
        imageUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
      ),
      ProfileModel(
        name: 'natasharahman',
        age: 27,
        category: 'Gaming – playstation',
        location: 'Miami, USA',
        rating: 4.5,
        reviewCount: 128,
        hourlyRate: 45,
        seirusPoints: 450,
        imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      ),
    ]);
  }
}