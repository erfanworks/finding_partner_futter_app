import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendModel {
  final String id;
  final String name;
  final int age;
  final String category;
  final String avatarUrl;

  FriendModel({
    required this.id,
    required this.name,
    required this.age,
    required this.category,
    required this.avatarUrl,
  });
}

class FriendsController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxList<FriendModel> friendsList = <FriendModel>[].obs;
  final RxList<FriendModel> filteredList = <FriendModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFriends();
  }

  void _loadFriends() {
    final mockData = [
      FriendModel(
        id: '1',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
      ),
      FriendModel(
        id: '2',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
      ),
      FriendModel(
        id: '3',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
      ),
      FriendModel(
        id: '4',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=11',
      ),
      FriendModel(
        id: '5',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=12',
      ),
      FriendModel(
        id: '6',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=16',
      ),
      FriendModel(
        id: '7',
        name: 'natasharomario',
        age: 27,
        category: 'Gaming - PlayStation',
        avatarUrl: 'https://i.pravatar.cc/150?img=68',
      ),
    ];
    friendsList.assignAll(mockData);
    filteredList.assignAll(mockData);
  }

  void searchFriend(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(friendsList);
    } else {
      filteredList.assignAll(
        friendsList.where((friend) =>
            friend.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void unfriend(String id) {
    friendsList.removeWhere((item) => item.id == id);
    filteredList.removeWhere((item) => item.id == id);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}