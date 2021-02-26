import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgress extends CustomPainter{

  final strokeCircle = 30.0;
  double currentValue;
  CircularProgress(this.currentValue);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
        ..strokeWidth = strokeCircle
        ..color = Colors.black
        ..style = PaintingStyle.stroke;

    Offset center  = Offset(size.width/2, size.height/2);
    double radiue = 100;
    canvas.drawCircle(center, radiue, circle);


    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = currentValue >40 ? Colors.green : Colors.red
      ..style = PaintingStyle.stroke
       ..strokeCap = StrokeCap.round;

    double angle  = 2 * pi * (currentValue/100);
    
    canvas.drawArc(Rect.fromCircle(center: center , radius: radiue), pi/2, angle,false , animationArc);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }




}