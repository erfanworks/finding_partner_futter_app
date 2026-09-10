import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/chat_screen_controller.dart';


class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09111E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150'),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Natasha Romano, 27',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@jhondoe  •  Miami, USA',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFFE5B069),
                    fontSize: 11.sp,
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF22C55E),
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8.w),
            height: 38.r,
            width: 38.r,
            decoration: BoxDecoration(
                color: const Color(0xFF151F30),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withAlpha(40))
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: SvgPicture.asset(
                AppImages.callIcon,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                height: 18.r,
                width: 18.r,
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) {
          return Column(
            children: [
              // Shared Media Top Badge
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5B069),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE5B069).withValues(alpha: 0.2),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Text(
                    'Shared media',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF09111E),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Text(
                'Today, 12:40PM',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF6B7B8E),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 12.h),

              // Chat Messages List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    return _buildMessageBubble(msg);
                  },
                ),
              ),

              // Bottom Input Bar
              _buildChatInputBar(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessageModel msg) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: msg.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!msg.isMe)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Icon(Icons.reply, color: Colors.white.withValues(alpha: 0.8), size: 18),
            ),
          Container(
            constraints: BoxConstraints(maxWidth: 0.72.sw),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: msg.isMe ? const Color(0xFF634E35) : const Color(0xFF2C2F38),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  msg.text,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 13.sp,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      msg.time,
                      style: GoogleFonts.dmSans(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 10.sp,
                      ),
                    ),
                    if (msg.isMe) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.done_all,
                        size: 14.sp,
                        color: msg.isRead ? const Color(0xFF38BDF8) : Colors.white.withValues(alpha: 0.6),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatInputBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xFF151F30),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Row(
                children: [
                  Icon(Icons.image_outlined, color: const Color(0xFF8C9BAE), size: 20.r),
                  SizedBox(width: 10.w),
                  Icon(Icons.sentiment_satisfied_outlined, color: const Color(0xFF8C9BAE), size: 20.r),
                  SizedBox(width: 10.w),
                  Container(width: 1, height: 18.h, color: Colors.white.withValues(alpha: 0.1)),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp),
                      decoration: InputDecoration(
                        hintText: 'Type Message',
                        hintStyle: GoogleFonts.dmSans(color: const Color(0xFF6B7B8E), fontSize: 13.sp),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic_none_outlined, color: const Color(0xFF8C9BAE), size: 20.r),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 48.r,
            height: 48.r,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE5B069), Color(0xFFB87B2E)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.send_rounded, color: const Color(0xFF09111E), size: 20.r),
          ),
        ],
      ),
    );
  }
}