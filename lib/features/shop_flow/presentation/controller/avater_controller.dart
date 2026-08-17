import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarFrameModel {
  final String id;
  final String title;
  final String price;
  final List<Color> borderColors;
  final bool isOwned;

  AvatarFrameModel({
    required this.id,
    required this.title,
    required this.price,
    required this.borderColors,
    this.isOwned = false,
  });
}

class AvatarFramesController extends GetxController {
  final String totalCoins = '999';

  final List<AvatarFrameModel> frameList = [
    AvatarFrameModel(
      id: '1',
      title: 'Nebula',
      price: '1800',
      borderColors: [const Color(0xFFFF52D9), const Color(0xFF7A22FF)],
      isOwned: false,
    ),
    AvatarFrameModel(
      id: '2',
      title: 'Nebula',
      price: '1800',
      borderColors: [const Color(0xFF00E5FF), const Color(0xFF2979FF)],
      isOwned: true,
    ),
    AvatarFrameModel(
      id: '3',
      title: 'Nebula',
      price: '1800',
      borderColors: [const Color(0xFFFF52D9), const Color(0xFF7A22FF)],
      isOwned: false,
    ),
    AvatarFrameModel(
      id: '4',
      title: 'Nebula',
      price: '1800',
      borderColors: [const Color(0xFF00E5FF), const Color(0xFF2979FF)],
      isOwned: false,
    ),
  ];

  void onUnlock(AvatarFrameModel frame) {
    // Unlock frame action logic
    update();
  }

  void onUseInProfile(AvatarFrameModel frame) {
    // Set frame logic
    update();
  }
}