import 'dart:math';
import 'package:blobs/src/painter/tools.dart';
import 'package:blobs/src/services/blob_error_handler.dart';
import 'package:flutter/material.dart';

import 'package:blobs/src/models.dart';

class BlobGenerator {
  final Size? size;
  int? edgesCount;
  int? minGrowth;
  String svgPath = '';
  String? id;
  List<List<Offset>> dots = [];

  BlobGenerator({
    this.id,
    this.edgesCount,
    this.minGrowth,
    this.size,
  });

  BlobData generate() {
    if (id != null) {
      var datum = id!.split('-');
      if (datum.length != 3) throw InvalidIDException(id);
      edgesCount = int.parse(datum[0]);
      minGrowth = int.parse(datum[1]);
      id = datum[2];
    }
    if (edgesCount! <= 2) throw InvalidEdgesCountException();
    var points = _createPoints(id != null ? int.parse(id!) : null);
    BlobCurves curves = _createCurves(points.destPoints!);
    Path path = connectPoints(curves);
    return BlobData(
      edges: edgesCount,
      growth: minGrowth,
      id: points.id,
      path: path,
      points: points,
      size: size!.width,
      svgPath: svgPath,
      curves: curves,
    );
  }

  BlobData generateFromPoints(List<Offset> destPoints) {
    BlobCurves curves = _createCurves(destPoints);
    Path path = connectPoints(curves);
    BlobPoints points = _createPointsFromDest(destPoints);
    return BlobData(
      edges: 0,
      growth: 0,
      id: '',
      path: path,
      points: points,
      size: 0,
      svgPath: null,
      curves: curves,
    );
  }

  double _toRad(double deg) => deg * (pi / 180.0);

  List<double> _divide(int count) {
    double deg = 360 / count;
    return List.generate(count, (i) => i * deg).toList();
  }

  //  https://stackoverflow.com/a/29450606/3096740
  double Function() _randomDoubleGenerator(int seedValue) {
    var mask = 0xffffffff;
    int mw = (123456789 + seedValue) & mask;
    int mz = (987654321 - seedValue) & mask;

    return () {
      mz = (36969 * (mz & 65535) + ((mz & mask) >> 16)) & mask;
      mw = (18000 * (mw & 65535) + ((mw & mask) >> 16)) & mask;

      final result = ((((mz << 16) + (mw & 65535)) & mask) >> 0) / 4294967296;
      return result;
    };
  }

  double _magicPoint(double value, double min, double max) {
    double radius = min + (value * (max - min));
    if (radius > max) {
      radius = radius - min;
    } else if (radius < min) {
      radius = radius + min;
    }
    return radius;
  }

  Offset _point(Offset origin, double radius, double degree) {
    double x = origin.dx + (radius * cos(_toRad(degree)));
    double y = origin.dy + (radius * sin(_toRad(degree)));
    return Offset(x.round().toDouble(), y.round().toDouble());
  }

  BlobPoints _createPoints(int? seedValue) {
    double outerRad = size!.width / 2;
    double innerRad = minGrowth! * (outerRad / 10);
    Offset center = Offset(size!.width / 2, size!.height / 2);

    List<double> slices = _divide(edgesCount!);
    int? randomInt;
    if (id != null) {
      seedValue = int.parse(id!);
    } else {
      int maxRandomValue = ([99, 999, 9999, 99999, 999999]..shuffle()).first;
      randomInt = Random().nextInt(maxRandomValue);
      seedValue = randomInt;
    }
    var randVal = _randomDoubleGenerator(seedValue);
    List<Offset> originPoints = [];
    List<Offset> destPoints = [];

    slices.forEach((degree) {
      double O = _magicPoint(randVal(), innerRad, outerRad);
      Offset start = _point(center, innerRad, degree);
      Offset end = _point(center, O, degree);
      originPoints.add(start);
      destPoints.add(end);
    });
    return BlobPoints(
      originPoints: originPoints,
      destPoints: destPoints,
      center: center,
      id: randomInt == null ? null : '$edgesCount-$minGrowth-$id',
      innerRad: innerRad.toDouble(),
    );
  }

  BlobPoints _createPointsFromDest(List<Offset> destPoints) {
    double outerRad = size!.width / 2;
    double innerRad = minGrowth! * (outerRad / 10);
    Offset center = Offset(size!.width / 2, size!.height / 2);

    List<double> slices = _divide(edgesCount!);

    List<Offset> originPoints = [];

    slices.forEach((degree) {
      Offset start = _point(center, innerRad, degree);
      originPoints.add(start);
    });
    return BlobPoints(
      originPoints: originPoints,
      destPoints: destPoints,
      center: center,
      id: null,
      innerRad: innerRad.toDouble(),
    );
  }

  BlobCurves _createCurves(List<Offset> points) {
    List<List<double>> curves = [];
    List<Offset> breakpoints = [];
    Offset mid = (points[0] + points[1]) / 2;
    breakpoints.add(mid);
    svgPath += 'M${mid.dx},${mid.dy}';

    for (var i = 0; i < points.length; i++) {
      var p1 = points[(i + 1) % points.length];
      var p2 = points[(i + 2) % points.length];
      mid = (p1 + p2) / 2;
      breakpoints.add(mid);

      svgPath += 'Q${p1.dx},${p1.dy},${mid.dx},${mid.dy}';
      curves.add([p1.dx, p1.dy, mid.dx, mid.dy]);
    }
    svgPath += 'Z';
    return BlobCurves(mid, curves, breakpoints);
  }
}
