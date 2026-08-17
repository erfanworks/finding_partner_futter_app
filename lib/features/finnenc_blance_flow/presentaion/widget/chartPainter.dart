import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFFE5B069)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final axisGridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1.0;

    final verticalGuideLinePaint = Paint()
      ..color = const Color(0xFFE5B069).withValues(alpha: 0.6)
      ..strokeWidth = 1.5;

    final months = ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];
    final stepX = size.width / (months.length + 1);

    for (int i = 0; i < months.length; i++) {
      final x = stepX * (i + 1);
      canvas.drawLine(Offset(x, 20), Offset(x, size.height - 30), axisGridPaint);

      final textSpan = TextSpan(
        text: months[i],
        style: TextStyle(color: Color(0xFF8C9BAE), fontSize: 12.sp,fontWeight: FontWeight.w400),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - (textPainter.width / 2), size.height - 20));
    }


    final yLabels = ['1k', '800', '600', '400', '200', '0'];
    final stepY = (size.height - 50) / (yLabels.length - 1);
    for (int i = 0; i < yLabels.length; i++) {
      final textSpan = TextSpan(
        text: yLabels[i],
        style: TextStyle(color: Color(0xFF92929D), fontSize: 12.sp,fontWeight: FontWeight.w400),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, stepY * i + 10));
    }

    final path = Path();
    final points = [
      Offset(stepX * 0.8, size.height * 0.55),
      Offset(stepX * 1.5, size.height * 0.65),
      Offset(stepX * 2.2, size.height * 0.60),
      Offset(stepX * 2.8, size.height * 0.45),
      Offset(stepX * 4.0, size.height * 0.52),
      Offset(stepX * 5.0, size.height * 0.65),
      Offset(stepX * 5.6, size.height * 0.55),
      Offset(stepX * 6.2, size.height * 0.62),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      path.cubicTo(
        (p1.dx + p2.dx) / 2,
        p1.dy,
        (p1.dx + p2.dx) / 2,
        p2.dy,
        p2.dx,
        p2.dy,
      );
    }
    canvas.drawPath(path, linePaint);
    final augPoint = points[4];
    canvas.drawLine(
      Offset(augPoint.dx, augPoint.dy),
      Offset(augPoint.dx, size.height - 30),
      verticalGuideLinePaint,
    );
    final outerDotPaint = Paint()..color = const Color(0xFFE5B069);
    final innerDotPaint = Paint()..color = Colors.white;
    canvas.drawCircle(augPoint, 7.r, outerDotPaint);
    canvas.drawCircle(augPoint, 4.r, innerDotPaint);

    final tooltipWidth = 80.w;
    final tooltipHeight = 42.h;
    final tooltipRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(augPoint.dx, augPoint.dy - tooltipHeight / 2 - 12.h),
        width: tooltipWidth,
        height: tooltipHeight,
      ),
      Radius.circular(12.r),
    );

    final tooltipBgPaint = Paint()..color = Colors.white;
    canvas.drawRRect(tooltipRect, tooltipBgPaint);

    final tooltipTextSpan = TextSpan(
      children: [
        TextSpan(
          text: '\$27632\n',
          style: TextStyle(
            color: const Color(0xFF171725),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: 'August',
          style: TextStyle(
            color: Color(0xFF696974),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400
          ),
        ),
      ],
    );

    final tooltipTextPainter = TextPainter(
      text: tooltipTextSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tooltipTextPainter.layout();
    tooltipTextPainter.paint(
      canvas,
      Offset(
        augPoint.dx - (tooltipTextPainter.width / 2),
        augPoint.dy - tooltipHeight - 6.h,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}