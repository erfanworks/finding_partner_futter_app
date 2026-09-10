import 'package:get/get.dart';
import '../../../../core/constants/app_images.dart';

class NotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final String iconPath;

  NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconPath,
  });
}

class NotificationScreenController extends GetxController {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      title: 'Bookings',
      subtitle: 'Booking confirmed, upcoming session reminders',
      time: '2 min',
      iconPath: AppImages.calendarIcon,
    ),
    NotificationItem(
      id: '2',
      title: 'Requests',
      subtitle: 'Requested companionships',
      time: '2 min',
      iconPath: AppImages.profileIcon,
    ),
    NotificationItem(
      id: '3',
      title: 'Comments',
      subtitle: 'New comments on Community Feed posts',
      time: '2 min',
      iconPath: AppImages.messageIcon,
    ),
    NotificationItem(
      id: '4',
      title: 'Ratings & reviews',
      subtitle: 'New reviews received',
      time: '2 min',
      iconPath: AppImages.ratingReviewIcon,
    ),
    NotificationItem(
      id: '5',
      title: 'Gifts & tips',
      subtitle: 'Gifts and tips received (shown in Seirus)',
      time: '2 min',
      iconPath: AppImages.giftIcon,
    ),
    NotificationItem(
      id: '6',
      title: 'Trust & safety',
      subtitle: 'Verification approved, Criminal Check expiring soon',
      time: '2 min',
      iconPath: AppImages.verificationIcon,
    ),
  ];
}
