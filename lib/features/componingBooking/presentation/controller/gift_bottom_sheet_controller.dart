import 'package:amychebbi/core/constants/app_images.dart';
import 'package:get/get.dart';

class GiftItemModel {
  final String id;
  final String name;
  final int price;
  final String icon;

  GiftItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
  });
}

class GiftsController extends GetxController {
  var selectedTab = 0.obs;
  var selectedGiftId = ''.obs;

  final List<String> tabs = ['Frame', 'Badge', 'Gift'];
  final List<GiftItemModel> giftsList = List.generate(
    12,
        (index) => GiftItemModel(
      id: '$index',
      name: 'Rose',
      price: 1800,
      icon: AppImages.roseImg,
    ),
  );

  void selectTab(int index) => selectedTab.value = index;
  void selectGift(String id) => selectedGiftId.value = id;
}