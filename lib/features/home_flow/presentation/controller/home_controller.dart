import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // স্লাইডারের কারেন্ট ইনডেক্স অবজার্ভ করার জন্য RxInt
  var currentBannerIndex = 0.obs;

  // PageView কন্ট্রোলার
  late PageController pageController;

  final List<Map<String, String>> bannerList = [
    {
      "title": "Weekend in Lisbon?",
      "subtitle": "Meet 24 local companion",
      "image": "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad",
    },
    {
      "title": "Explore Paris",
      "subtitle": "Meet 18 local companion",
      "image": "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
    },
    {
      "title": "Trip to Rome",
      "subtitle": "Meet 30 local companion",
      "image": "https://images.unsplash.com/photo-1552832230-c0197dd311b5",
    },
    {
      "title": "Enjoy Tokyo",
      "subtitle": "Meet 15 local companion",
      "image": "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf",
    },
    {
      "title": "Visit Dubai",
      "subtitle": "Meet 25 local companion",
      "image": "https://images.unsplash.com/photo-1512453979798-5ea266f8880c",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void updateBannerIndex(int index) {
    currentBannerIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}