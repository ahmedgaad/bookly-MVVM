import 'package:flutter/material.dart';

class TicketPainter extends CustomPainter {
  final Shadow? shadow;
  final CustomClipper<Path> clipper;

  TicketPainter({
    this.shadow,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (shadow != null) {
      final paintShadow = shadow!.toPaint();
      final pathShadow = clipper.getClip(size).shift(shadow!.offset);
      canvas.drawPath(pathShadow, paintShadow);
    }

    final paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.grey[300]!;
    final pathBorder = clipper.getClip(size);
    canvas.drawPath(pathBorder, paintBorder);
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => this != oldDelegate;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => this != oldDelegate;
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= -50) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
