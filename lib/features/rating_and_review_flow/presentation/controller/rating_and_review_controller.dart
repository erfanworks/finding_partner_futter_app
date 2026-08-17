import 'package:get/get.dart';

class ReviewReply {
  final String avatarUrl;
  final String username;
  final int age;
  final String timeAgo;
  final String comment;

  ReviewReply({
    required this.avatarUrl,
    required this.username,
    required this.age,
    required this.timeAgo,
    required this.comment,
  });
}

class ReviewModel {
  final String avatarUrl;
  final String username;
  final int age;
  final double rating;
  final String timeAgo;
  final String comment;
  final ReviewReply? reply;

  ReviewModel({
    required this.avatarUrl,
    required this.username,
    required this.age,
    required this.rating,
    required this.timeAgo,
    required this.comment,
    this.reply,
  });
}

class RatingReviewController extends GetxController {
  final double averageRating = 4.5;
  final int totalReviews = 128;

  // Star Rating Counts: 5-star -> 120, 4-star -> 40, etc.
  final Map<int, int> ratingCounts = {
    5: 120,
    4: 40,
    3: 20,
    2: 5,
    1: 0,
  };

  final List<ReviewModel> reviews = [
    ReviewModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      username: 'jhondoe',
      age: 21,
      rating: 5.0,
      timeAgo: '2 min',
      comment: 'Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!',
      reply: ReviewReply(
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
        username: 'hasina',
        age: 27,
        timeAgo: '2 min',
        comment: 'Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!',
      ),
    ),
    ReviewModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      username: 'khaleda',
      age: 45,
      rating: 5.0,
      timeAgo: '2 min',
      comment: 'Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!',
    ),
    ReviewModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
      username: 'Paru',
      age: 24,
      rating: 5.0,
      timeAgo: '2 min',
      comment: 'Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!',
    ),
    ReviewModel(
      avatarUrl: 'https://i.pravatar.cc/150?img=33',
      username: 'selim',
      age: 22,
      rating: 5.0,
      timeAgo: '2 min',
      comment: 'Maya made our Miami trip unforgettable. Local spots, great vibes, will book again!',
    ),
  ];

  int get maxRatingCount => ratingCounts.values.reduce((a, b) => a > b ? a : b);
}