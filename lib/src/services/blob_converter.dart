import 'dart:convert';
import 'package:blobs/src/services/blob_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:archive/archive.dart';

import 'package:blobs/src/models.dart';

mixin BlobConverter {
  String dotsToHash(List<List<Offset>> dots,
      [double originalSize, int innerRad = 0]) {
    List<List<double>> endPoints = dots.map((e) => [e[1].dx, e[1].dy]).toList();
    List<int> points = endPoints
        .expand((e) => e)
        .toList()
        .map((double c) => c.round())
        .toList();
    points.add(originalSize.toInt());
    points.add(innerRad);
    String jsonEncoded = json.encode(points);
    List<int> utf8Encoded = utf8.encode(jsonEncoded);
    List<int> gzipEncoded = GZipEncoder().encode(utf8Encoded);
    String base64Encoded = base64.encode(gzipEncoded);

    return base64Encoded;
  }

  BlobDots hashToDots(String hash) {
    List<int> x = [];
    List<int> y = [];
    List<List<Offset>> dots = [];

    List<int> base64Decoded;
    List<int> gzipDecoded;
    String utf8Decoded;
    List<int> jsonDecoded;

    try {
      base64Decoded = base64.decode(hash);
      gzipDecoded = GZipDecoder().decodeBytes(base64Decoded);
      utf8Decoded = utf8.decode(gzipDecoded);
      jsonDecoded = json.decode(utf8Decoded).cast<int>();
    } on Exception catch (_) {
      throw InvalidHashIDException(hash);
    }

    dynamic data = jsonDecoded;

    List<int> dotpoints = data.sublist(0, data.length - 2).cast<int>();
    int originalSize = data[data.length - 2];
    int innerRad = data[data.length - 1];
    dotpoints.asMap().forEach((i, val) {
      if (i.isEven) {
        x.add(dotpoints[i]);
      } else {
        y.add(dotpoints[i]);
      }
    });

    x.asMap().forEach((i, val) {
      dots.add([Offset(0, 0), Offset(x[i].toDouble(), y[i].toDouble())]);
    });
    return BlobDots(
        dots: dots, innerRad: innerRad.toDouble(), originalSize: originalSize);
  }
}
