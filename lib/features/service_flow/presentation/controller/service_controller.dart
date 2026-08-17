import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceItem {
  final String id;
  final String title;
  final String category;
  final String price;
  final String imageUrl;

  ServiceItem({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
}

class ServicesController extends GetxController {
  // Services List (Normal List, not Rx)
  List<ServiceItem> servicesList = [];

  // Add Service Form State Variables
  String selectedCategory = 'Gaming';
  String selectedSubService = 'Playstation';
  final TextEditingController priceController = TextEditingController(text: '\$45.00');

  final List<String> categories = ['Gaming', 'Travel', 'Fitness'];
  final List<String> subServices = ['Playstation', 'Xbox', 'PC'];

  @override
  void onInit() {
    super.onInit();
    _loadInitialServices();
  }

  void _loadInitialServices() {
    servicesList = [
      ServiceItem(
        id: '1',
        title: 'nishirojario, 24',
        category: 'Gaming- Xbox',
        price: '\$45/hr',
        imageUrl: 'https://picsum.photos/300/300?random=100',
      ),
      ServiceItem(
        id: '2',
        title: 'nishirojario, 24',
        category: 'Gaming- Xbox',
        price: '\$45/hr',
        imageUrl: 'https://picsum.photos/300/300?random=101',
      ),
    ];
    update(); // UI Refresh
  }

  void setCategory(String value) {
    selectedCategory = value;
    update(); // Refresh UI for Category Dropdown
  }

  void setSubService(String value) {
    selectedSubService = value;
    update(); // Refresh UI for SubService Dropdown
  }

  void deleteService(String id) {
    servicesList.removeWhere((item) => item.id == id);
    update(); // Refresh UI after delete
  }

  void addService() {
    if (priceController.text.isNotEmpty) {
      servicesList.add(
        ServiceItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: 'nishirojario, 24',
          category: '$selectedCategory- $selectedSubService',
          price: priceController.text.startsWith('\$')
              ? '${priceController.text}/hr'
              : '\$${priceController.text}/hr',
          imageUrl: 'https://picsum.photos/300/300?random=${DateTime.now().millisecond}',
        ),
      );
      update(); // Refresh UI with new item
      Get.back();
    }
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }
}