import 'package:flutter/material.dart';

class BlobDots {
  final List<List<Offset>> dots;
  final double innerRad;
  final num originalSize;

  BlobDots({this.dots, this.innerRad, this.originalSize});
}

class BlobData {
  final List<List<Offset>> dots;
  final double innerRad;
  final String svgPath;
  final BlobPainterCoords coords;
  final String hash;
  final int edgesCount;
  final int minGrowth;
  final Size size;
  final num originalSize;

  BlobData({
    this.dots,
    this.innerRad,
    this.svgPath,
    this.coords,
    this.hash,
    this.edgesCount,
    this.minGrowth,
    this.size,
    this.originalSize,
  });
}

class BlobPainterCoords {
  final Offset start;
  final List<List<double>> curves;
  BlobPainterCoords(this.start, this.curves);
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
