import 'package:blobs/src/models.dart';
import 'package:blobs/src/painter/tools.dart';
import 'package:flutter/material.dart';

class BlobPainter extends CustomPainter {
  final BlobData blobData;
  final bool debug;
  final BlobStyles? styles;

  BlobPainter({
    required this.blobData,
    this.styles,
    this.debug = false,
  });

  @override
  void paint(Canvas c, Size s) {
    drawBlob(c, blobData.path!, styles);
    if (debug) {
      circle(c, s, (s.width / 2)); // outer circle
      circle(c, s, blobData.points!.innerRad!); // inner circle
      point(c, Offset(s.width / 2, s.height / 2)); // center point
      List originPoints = blobData.points!.originPoints!;
      List? destPoints = blobData.points!.destPoints;
      originPoints.asMap().forEach(
            (i, p) => drawLines(c, p, destPoints![i]),
          ); // line from  inner  circle to blob point
    }
  }

  drawLines(Canvas c, Offset p0, Offset p1) {
    point(c, p0);
    point(c, p1);
    line(c, p0, p1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
