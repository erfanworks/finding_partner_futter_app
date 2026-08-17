import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageModel {
  final String language;
  final String proficiency;

  LanguageModel({required this.language, required this.proficiency});
}

class CollectionModel {
  final String title;
  final String imageUrl;

  CollectionModel({required this.title, required this.imageUrl});
}

class ProfileInformationController extends GetxController {
  // Text Controllers
  final nicknameController = TextEditingController(text: 'Nickname');
  final genderController = TextEditingController(text: 'Male');
  final countryController = TextEditingController(text: 'Germany');
  final cityController = TextEditingController(text: 'Berlin');
  final locationController = TextEditingController(text: 'Berlin, Germany');
  final bioController = TextEditingController(text: 'Berlin, Germany');

  // Static Data
  final String username = 'Username';
  final String genderSubText = 'Gender: Female';
  final String ageSubText = 'Age: 25';
  final String coverImageUrl = 'https://picsum.photos/800/400';
  final String profileImageUrl = 'https://i.pravatar.cc/150?img=5';

  // Collections
  final List<CollectionModel> collections = [
    CollectionModel(title: 'Europe Trip', imageUrl: 'https://picsum.photos/200/200?random=1'),
    CollectionModel(title: 'Europe Trip', imageUrl: 'https://picsum.photos/200/200?random=2'),
  ];

  // Interests & Languages
  final List<String> interests = ['Gaming', 'Fitness', 'Social Talking'];
  final List<LanguageModel> languages = [
    LanguageModel(language: 'English', proficiency: 'Native'),
    LanguageModel(language: 'German', proficiency: 'Fluent'),
    LanguageModel(language: 'Hindi', proficiency: 'Fluent'),
  ];

  void onSave() {
    // Save profile logic
  }

  void onEditInterests() {}
  void onEditLanguages() {}
  void onAddCollection() {}

  @override
  void onClose() {
    nicknameController.dispose();
    genderController.dispose();
    countryController.dispose();
    cityController.dispose();
    locationController.dispose();
    bioController.dispose();
    super.onClose();
  }
}