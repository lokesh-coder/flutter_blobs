import 'package:blobs/src/config.dart';
import 'package:flutter/material.dart';

class BlobData {
  int growth;
  num size;
  int edges;
  BlobPoints points;
  String? id;
  Path path;
  String? svgPath;
  BlobCurves curves;

  BlobData({
    required this.growth,
    required this.size,
    required this.edges,
    required this.points,
    required this.id,
    required this.path,
    required this.svgPath,
    required this.curves,
  });
}

class BlobCurves {
  final Offset start;
  final List<List<double>> curves;
  final List<Offset> breakpoints;
  BlobCurves(this.start, this.curves, this.breakpoints);
}

enum BlobFillType { fill, stroke }

class BlobStyles {
  Color color;
  Shader? gradient;
  int strokeWidth;
  BlobFillType fillType;
  BlobStyles({
    this.color = BlobConfig.color,
    this.gradient,
    this.fillType = BlobConfig.fillType,
    this.strokeWidth = BlobConfig.strokeWidth,
  });
}

class BlobPoints {
  List<Offset> originPoints;
  List<Offset> destPoints;
  Offset center;
  double innerRad;
  String? id;
  BlobPoints({
    required this.originPoints,
    required this.destPoints,
    required this.center,
    required this.id,
    required this.innerRad,
  });
}
