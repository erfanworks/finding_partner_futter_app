import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });
}

class NotificationScreenController extends GetxController {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      title: 'Bookings',
      subtitle: 'Booking confirmed, upcoming session reminders',
      time: '2 min',
      icon: Icons.calendar_month_outlined,
    ),
    NotificationItem(
      id: '2',
      title: 'Requests',
      subtitle: 'Requested companionships',
      time: '2 min',
      icon: Icons.person_outline_rounded,
    ),
    NotificationItem(
      id: '3',
      title: 'Comments',
      subtitle: 'New comments on Community Feed posts',
      time: '2 min',
      icon: Icons.chat_bubble_outline_rounded,
    ),
    NotificationItem(
      id: '4',
      title: 'Ratings & reviews',
      subtitle: 'New reviews received',
      time: '2 min',
      icon: Icons.star_border_rounded,
    ),
    NotificationItem(
      id: '5',
      title: 'Gifts & tips',
      subtitle: 'Gifts and tips received (shown in Seirus)',
      time: '2 min',
      icon: Icons.card_giftcard_rounded,
    ),
    NotificationItem(
      id: '6',
      title: 'Trust & safety',
      subtitle: 'Verification approved, Criminal Check expiring soon',
      time: '2 min',
      icon: Icons.shield_outlined,
    ),
  ];
}