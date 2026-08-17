import 'package:get/get.dart';

class SeiroPackModel {
  final String id;
  final String title;
  final String price;
  final String imageUrl;

  SeiroPackModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

class SeiroShopController extends GetxController {
  final String totalCoins = '999';

  final List<SeiroPackModel> shopItems = [
    SeiroPackModel(
      id: '1',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCurtqGlel30xkfyrv3y_rqLcWBKUu19q0R6356Xbe9w&s=10',
    ),
    SeiroPackModel(
      id: '2',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV1BfSJ4QRgY2C-1pPCrL8TVgQZDevcvzck-Z6HiYP4w&s=10',
    ),
    SeiroPackModel(
      id: '3',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
    ),
    SeiroPackModel(
      id: '4',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://www.reuters.com/markets/us/coming-crypto-storm-central-banks-focus-digital-money-intensifies-2022-06-02/',
    ),
    SeiroPackModel(
      id: '5',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpiyhjI6V8YDZq_fwHn_coCNFIopZS8Fhc28S-wCjdWA&s=10',
    ),
    SeiroPackModel(
      id: '6',
      title: '240 Seiru',
      price: '\$9.99',
      imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
    ),
  ];

  void onBuyPack(SeiroPackModel pack) {
    // Purchase action logic
  }
}