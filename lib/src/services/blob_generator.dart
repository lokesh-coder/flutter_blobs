import 'dart:math';
import 'package:flutter/material.dart';

import 'package:blobs/src/models.dart';
import 'package:blobs/src/services/blob_converter.dart';

class BlobGenerator with BlobConverter {
  final int edgesCount;
  final int minGrowth;
  final Size size;
  String svgPath = '';
  String hash;
  List<List<Offset>> dots = [];

  BlobGenerator({
    this.hash,
    this.edgesCount,
    this.minGrowth,
    this.size,
  });

  BlobData generate(
      [List initialDots, double initialInnerRad, int originalSize]) {
    List<List<Offset>> dots = initialDots;
    double innerRad = initialInnerRad;

    if (dots == null) {
      var blobDots = hash != null ? hashToDots(hash) : _createDots();
      dots = blobDots.dots;
      innerRad = blobDots.innerRad;
      originalSize = blobDots.originalSize;
    }
    List<Offset> endDots = dots.map((d) => d[1]).toList();
    BlobPainterCoords coords = _createPath(endDots);
    return BlobData(
      dots: dots,
      innerRad: innerRad,
      coords: coords,
      svgPath: svgPath,
      size: size,
      originalSize: originalSize,
      hash: hash ?? dotsToHash(dots, size.width, innerRad.toInt()),
    );
  }

  num _toRad(num deg) => deg * (pi / 180.0);

  List<double> _divide(num count) {
    double deg = 360 / count;
    return List.generate(count, (i) => i * deg).toList();
  }

  double _magicPoint(num min, num max) {
    double radius = min + (Random().nextDouble() * (max - min));
    if (radius > max) {
      radius = radius - min;
    } else if (radius < min) {
      radius = radius + min;
    }
    return radius;
  }

  Offset _point(Offset origin, double radius, num degree) {
    double x = origin.dx + (radius * cos(_toRad(degree)));
    double y = origin.dy + (radius * sin(_toRad(degree)));
    return Offset(x.round().toDouble(), y.round().toDouble());
  }

  BlobDots _createDots() {
    num outerRad = size.width / 2;
    num innerRad = minGrowth * (outerRad / 10);
    Offset center = Offset(size.width / 2, size.height / 2);

    List<double> slices = _divide(edgesCount);

    slices.forEach((degree) {
      double O = _magicPoint(innerRad, outerRad);
      Offset start = _point(center, innerRad, degree);
      Offset end = _point(center, O, degree);
      dots.add([start, end]);
    });
    return BlobDots(dots: dots, innerRad: innerRad);
  }

  BlobPainterCoords _createPath(List<Offset> points) {
    List<List<double>> curves = [];
    Offset mid = (points[0] + points[1]) / 2;
    svgPath += 'M${mid.dx},${mid.dy}';

    for (var i = 0; i < points.length; i++) {
      var p1 = points[(i + 1) % points.length];
      var p2 = points[(i + 2) % points.length];
      mid = (p1 + p2) / 2;

      svgPath += 'Q${p1.dx},${p1.dy},${mid.dx},${mid.dy}';
      curves.add([p1.dx, p1.dy, mid.dx, mid.dy]);
    }
    svgPath += 'Z';
    return BlobPainterCoords(mid, curves);
  }
}
