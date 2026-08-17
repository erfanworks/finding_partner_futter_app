import 'package:get/get.dart';

class ShopCategory {
  final String title;
  final String iconPath; // Icon data placeholder

  ShopCategory({required this.title, required this.iconPath});
}

class ShopItem {
  final String title;
  final int price;
  final String iconType; // 'star' or 'ribbon'

  ShopItem({
    required this.title,
    required this.price,
    required this.iconType,
  });
}

class ShopController extends GetxController {
  final String coinCount = '999';

  final List<ShopCategory> categories = [
    ShopCategory(title: 'Frames', iconPath: 'frame'),
    ShopCategory(title: 'Badges', iconPath: 'badge'),
    ShopCategory(title: 'Gifts', iconPath: 'gift'),
  ];

  final List<ShopItem> trendingItems = [
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'star'),
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'ribbon'),
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'star'),
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'star'),
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'ribbon'),
    ShopItem(title: 'Neon Halo', price: 1800, iconType: 'star'),
  ];

  void onCategoryTap(String title) {}

  void onItemTap(ShopItem item) {}
}