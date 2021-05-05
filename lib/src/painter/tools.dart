import 'package:blobs/src/config.dart';
import 'package:blobs/src/models.dart';
import 'package:flutter/material.dart';

circle(Canvas canvas, Size size, double radius) {
  var paint = Paint()
    ..color = const Color(0xffef5777)
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke;

  var path = Path();
  path.addOval(Rect.fromCircle(
    center: Offset(size.width / 2, size.height / 2),
    radius: radius,
  ));
  canvas.drawPath(path, paint);
}

label(Canvas canvas, String text, Offset offset) {
  final textSpan = TextSpan(
    text: text,
    style: TextStyle(color: Colors.black, fontSize: 16),
  );
  final textPainter =
      TextPainter(text: textSpan, textDirection: TextDirection.ltr);
  textPainter.layout(
    minWidth: 0,
    maxWidth: 100,
  );
  textPainter.paint(canvas, offset + Offset(0, -20));
}

line(Canvas canvas, Offset start, Offset end) {
  var paint = Paint()
    ..color = Color(0xff596275).withOpacity(0.5)
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  canvas.drawLine(start, end, paint);
}

point(Canvas canvas, Offset center) {
  var paint = Paint()
    ..color = const Color(0xff1e272e)
    ..strokeWidth = 1
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round;

  var path = Path();
  path.addOval(Rect.fromCircle(
    center: center,
    radius: 3,
  ));
  canvas.drawPath(path, paint);
}

Paint createPaint(BlobStyles? styles) {
  Map<BlobFillType, PaintingStyle> fillType = {
    BlobFillType.fill: PaintingStyle.fill,
    BlobFillType.stroke: PaintingStyle.stroke
  };
  if (styles == null) styles = BlobStyles();

  var paint = Paint();
  paint.color = styles.color ?? BlobConfig.color;
  paint.shader = styles.gradient;
  paint.strokeWidth = (styles.strokeWidth ?? BlobConfig.strokeWidth).toDouble();
  paint.style = fillType[styles.fillType ?? BlobConfig.fillType]!;

  return paint;
}

Path connectPoints(BlobCurves curves) {
  var path = Path();
  path.moveTo(curves.start.dx, curves.start.dy);
  curves.curves.forEach((curve) {
    path.quadraticBezierTo(curve[0], curve[1], curve[2], curve[3]);
  });
  path.close();

  return path;
}

void drawBlob(Canvas canvas, Path path, BlobStyles? styles) {
  Paint paint = createPaint(styles);
  // canvas.drawShadow(path, Colors.red.withOpacity(0.8), 10, true);
  canvas.drawPath(path, paint);
}
