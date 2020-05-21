import 'package:flutter/material.dart';

class BlobDots {
  final List<List<Offset>> dots;
  final double innerRad;
  final num originalSize;
  final num hash;

  BlobDots({this.dots, this.innerRad, this.originalSize, this.hash});
}

class BlobData {
  int growth;
  num size;
  int edges;
  BlobPoints points;
  String id;
  Path path;
  String svgPath;
  BlobCurves curves;

  BlobData({
    this.growth,
    this.size,
    this.edges,
    this.points,
    this.id,
    this.path,
    this.svgPath,
    this.curves,
  });
}

class BlobCurves {
  final Offset start;
  final List<List<double>> curves;
  BlobCurves(this.start, this.curves);
}

enum BlobFillType { fill, stroke }

class BlobStyles {
  Color color;
  Shader gradient;
  int strokeWidth;
  BlobFillType fillType;
  BlobStyles({
    this.color,
    this.gradient,
    this.fillType,
    this.strokeWidth,
  });
}

class BlobPoints {
  List<Offset> originPoints;
  List<Offset> destPoints;
  Offset center;
  double innerRad;
  String id;
  BlobPoints({
    this.originPoints,
    this.destPoints,
    this.center,
    this.id,
    this.innerRad,
  });
}
