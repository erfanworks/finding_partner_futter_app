import 'package:get/get.dart';

class ChatConversationModel {
  final String id;
  final String name;
  final int age;
  final String username;
  final String location;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final bool isOnline;

  ChatConversationModel({
    required this.id,
    required this.name,
    required this.age,
    required this.username,
    required this.location,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
  });
}

class ChatMessageModel {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final bool isRead;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    this.isRead = false,
  });
}

class ChatScreenController extends GetxController {
  final List<ChatConversationModel> conversations = [
    ChatConversationModel(
      id: '1',
      name: 'Jhon doe',
      age: 27,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      isOnline: true,
    ),
    ChatConversationModel(
      id: '2',
      name: 'Jhon doe',
      age: 25,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      isOnline: true,
    ),
    ChatConversationModel(
      id: '3',
      name: 'Jhon doe',
      age: 28,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      isOnline: true,
    ),
    ChatConversationModel(
      id: '4',
      name: 'Jhon doe',
      age: 26,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?w=150',
      isOnline: true,
    ),
    ChatConversationModel(
      id: '5',
      name: 'Jhon doe',
      age: 29,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=150',
      isOnline: true,
    ),
    ChatConversationModel(
      id: '6',
      name: 'Jhon doe',
      age: 24,
      username: '@jhondoe',
      location: 'Miami, USA',
      lastMessage: 'Are we still meeting at the ...',
      time: '2:45 PM',
      unreadCount: 2,
      avatarUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150',
      isOnline: true,
    ),
  ];

  final List<ChatMessageModel> messages = [
    ChatMessageModel(
      id: '1',
      text: 'Hi Ava! Excited for tomorrow 🌴 Any food preferences?',
      time: '12:40PM',
      isMe: false,
    ),
    ChatMessageModel(
      id: '2',
      text: 'Anything with seafood Also would love to see the murals',
      time: '12:40PM',
      isMe: true,
      isRead: true,
    ),
    ChatMessageModel(
      id: '3',
      text: 'Hi Ava! Excited for tomorrow 🌴 Any food preferences?',
      time: '12:40PM',
      isMe: false,
    ),
    ChatMessageModel(
      id: '4',
      text: 'Anything with seafood Also would love to see the murals',
      time: '12:40PM',
      isMe: true,
      isRead: false,
    ),
  ];
}