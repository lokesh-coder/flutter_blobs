import 'package:blobs/src/config.dart';
import 'package:blobs/src/painter/tools.dart';
import 'package:blobs/src/services/blob_generator.dart';
import 'package:flutter/material.dart';

class BlobClipper extends CustomClipper<Path> {
  final String hash;
  final int edgesCount;
  final int minGrowth;
  BlobClipper({
    this.hash,
    this.edgesCount = BlobConfig.edgesCount,
    this.minGrowth = BlobConfig.minGrowth,
  });

  @override
  Path getClip(Size size) {
    var blobData = BlobGenerator(
      hash: hash,
      edgesCount: edgesCount,
      minGrowth: minGrowth,
      size: size,
    ).generate();
    return shape(blobData);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
