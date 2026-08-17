import 'package:get/get.dart';

class GiftItem {
  final String id;
  final String name;
  final String price;
  final String iconUrl;
  final bool isOwned;

  GiftItem({
    required this.id,
    required this.name,
    required this.price,
    required this.iconUrl,
    this.isOwned = false,
  });
}

class ShopGiftsController extends GetxController {
  final String coinCount = '999';

  final List<GiftItem> giftList = [
    // Top Row (Owned)
    GiftItem(id: '1', name: 'Rose', price: '1800', iconUrl: '', isOwned: true),
    GiftItem(id: '2', name: 'Rose', price: '1800', iconUrl: '', isOwned: true),
    GiftItem(id: '3', name: 'Rose', price: '1800', iconUrl: '', isOwned: true),
    // Remaining Rows
    GiftItem(id: '4', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '5', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '6', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '7', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '8', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '9', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '10', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '11', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '12', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '13', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '14', name: 'Rose', price: '1800', iconUrl: ''),
    GiftItem(id: '15', name: 'Rose', price: '1800', iconUrl: ''),
  ];

  void selectGift(GiftItem gift) {
    // Gift selection action
    update();
  }
}