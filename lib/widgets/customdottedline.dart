import 'package:flutter/material.dart';

class VerticalDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double startY = 0;
    const double dashLength = 7; // Length of each dash
    const double gap = 4; // Space between dashes

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashLength),
        paint,
      );
      startY += dashLength + gap; // Move forward for the next dash
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}