import 'package:get/get.dart';

class SavedFeedModel {
  final String id;
  final String userName;
  final int age;
  final String gender;
  final String location;
  final String timeTag;
  final String categoryTag;
  final String postTime;
  final String avatarUrl;
  final String description;
  final String postImageUrl;
  final int commentCount;
  final String lastCommenter;
  final int otherCommentsCount;
  final int availableCompanionsCount;
  final List<String> companionAvatars;

  SavedFeedModel({
    required this.id,
    required this.userName,
    required this.age,
    required this.gender,
    required this.location,
    required this.timeTag,
    required this.categoryTag,
    required this.postTime,
    required this.avatarUrl,
    required this.description,
    required this.postImageUrl,
    required this.commentCount,
    required this.lastCommenter,
    required this.otherCommentsCount,
    required this.availableCompanionsCount,
    required this.companionAvatars,
  });
}

class SavedFeedController extends GetxController {
  final RxList<SavedFeedModel> savedFeeds = <SavedFeedModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedFeeds();
  }

  void _loadSavedFeeds() {
    savedFeeds.assignAll([
      SavedFeedModel(
        id: '1',
        userName: 'Jamie L',
        age: 27,
        gender: 'Male',
        location: 'Florida',
        timeTag: '3:30 PM',
        categoryTag: 'Gaming- Xbox',
        postTime: '15m ago',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
        description:
        'Looking for a fitness partner for a morning run in Central Park. Pace 5:30/km.',
        postImageUrl: 'https://picsum.photos/600/350?random=10',
        commentCount: 12,
        lastCommenter: 'Jhon',
        otherCommentsCount: 11,
        availableCompanionsCount: 3,
        companionAvatars: [
          'https://i.pravatar.cc/150?img=11',
          'https://i.pravatar.cc/150?img=12',
          'https://i.pravatar.cc/150?img=13',
        ],
      ),
    ]);
  }

  void onSendMessage(String feedId) {}

  void onAvailableTap(String feedId) {}

  void onMoreOptions(String feedId) {}
}