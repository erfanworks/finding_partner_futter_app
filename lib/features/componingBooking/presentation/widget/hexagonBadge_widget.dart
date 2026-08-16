import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HexagonBadge extends StatelessWidget {
  final String text;

  const HexagonBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HexagonBorderPainter(),
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          color: const Color(0xFF2B2927),
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              color:  Color(0xFFEDC286),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double cutWidth = 10.w;

    path.moveTo(cutWidth, 0);
    path.lineTo(size.width - cutWidth, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - cutWidth, size.height);
    path.lineTo(cutWidth, size.height);
    path.lineTo(0, size.height / 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HexagonBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double cutWidth = 10.w;
    Path getBorderPath(double offset) {
      final path = Path();
      path.moveTo(cutWidth + offset, offset);
      path.lineTo(size.width - cutWidth - offset, offset);
      path.lineTo(size.width - offset, size.height / 2);
      path.lineTo(size.width - cutWidth - offset, size.height - offset);
      path.lineTo(cutWidth + offset, size.height - offset);
      path.lineTo(offset, size.height / 2);
      path.close();
      return path;
    }

    final outerPaint = Paint()
      ..color = const Color(0xFFEDC286)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.w;

    final innerPaint = Paint()
      ..color = const Color(0xFF8C6D38)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(getBorderPath(0), outerPaint);
    canvas.drawPath(getBorderPath(2.5), innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}