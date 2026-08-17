import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/chat_screen_controller.dart';


class ChatSelectionScreen extends StatelessWidget {
  const ChatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09111E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
              onPressed: () => Get.back(),
            ),
            Text(
              '1',
              style: GoogleFonts.dmSans(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.reply, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.star_border, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.delete_outline, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.push_pin_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5B069),
                    borderRadius: BorderRadius.circular(20.r),
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
                style: GoogleFonts.dmSans(color: const Color(0xFF6B7B8E), fontSize: 12.sp),
              ),
              SizedBox(height: 12.h),

              // Selected Highlight Overlay on First Item
              Container(
                width: double.infinity,
                color: Colors.white.withValues(alpha: 0.08),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 0.72.sw),
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A4E5A),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              'Hi Ava! Excited for tomorrow 🌴 Any food preferences?',
                              style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text('12:40PM', style: GoogleFonts.dmSans(color: Colors.white54, fontSize: 10.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Remaining Messages List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  itemCount: controller.messages.length - 1,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index + 1];
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
                                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp, height: 1.3),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(msg.time, style: GoogleFonts.dmSans(color: Colors.white.withValues(alpha: 0.6), fontSize: 10.sp)),
                                    if (msg.isMe) ...[
                                      SizedBox(width: 4.w),
                                      Icon(Icons.done_all, size: 14.sp, color: msg.isRead ? const Color(0xFF38BDF8) : Colors.white.withValues(alpha: 0.6)),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Floating Reply Preview Card and Bottom Bar
              _buildReplyOverlayInput(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildReplyOverlayInput() {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Reply Message Preview Box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2B),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Natasha Romano, 27',
                      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.close, color: Colors.white.withValues(alpha: 0.6), size: 16.r),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'Hi Ava! Excited for tomorrow 🌴 Any food preferences?',
                  style: GoogleFonts.dmSans(color: const Color(0xFF8C9BAE), fontSize: 12.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // Bottom Input Controls
          Row(
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
                  gradient: LinearGradient(colors: [Color(0xFFE5B069), Color(0xFFB87B2E)]),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.send_rounded, color: const Color(0xFF09111E), size: 20.r),
              ),
            ],
          ),
        ],
      ),
    );
  }
}