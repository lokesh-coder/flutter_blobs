import 'dart:async';

import 'package:blobs/blobs.dart';
import 'package:blobs/src/config.dart';
import 'package:blobs/src/models.dart';
import 'package:blobs/src/services/blob_generator.dart';
import 'package:blobs/src/widgets/animated_blob.dart';
import 'package:blobs/src/widgets/simple_blob.dart';
import 'package:flutter/material.dart';

class Blob extends StatefulWidget {
  final double size;
  final bool debug;
  final BlobStyles styles;
  final BlobController controller;
  final Widget child;
  final int edgesCount;
  final int minGrowth;
  final List<String> id;
  final Duration duration;
  final bool loop;
  final bool isAnimated;

  static int count = 0;

  Blob.random({
    @required this.size,
    this.edgesCount = BlobConfig.edgesCount,
    this.minGrowth = BlobConfig.minGrowth,
    this.debug = false,
    this.styles,
    this.controller,
    this.child,
  })  : loop = false,
        id = null,
        duration = null,
        isAnimated = false;
  Blob.animatedRandom({
    @required this.size,
    this.edgesCount = BlobConfig.edgesCount,
    this.minGrowth = BlobConfig.minGrowth,
    this.debug = false,
    this.styles,
    this.duration = const Duration(
      milliseconds: BlobConfig.animDurationMs,
    ),
    this.loop = false,
    this.controller,
    this.child,
  })  : isAnimated = true,
        id = null;

  Blob.fromID({
    @required this.id,
    @required this.size,
    this.debug = false,
    this.styles,
    this.controller,
    this.child,
  })  : loop = false,
        edgesCount = null,
        minGrowth = null,
        duration = null,
        isAnimated = false;

  Blob.animatedFromID({
    @required this.id,
    @required this.size,
    this.debug = false,
    this.styles,
    this.duration = const Duration(
      milliseconds: BlobConfig.animDurationMs,
    ),
    this.loop = false,
    this.controller,
    this.child,
  })  : isAnimated = true,
        edgesCount = null,
        minGrowth = null;

  @override
  _BlobState createState() => _BlobState();

  BlobData _randomBlobData() {
    String randomID = (id == null || id.isEmpty) ? null : _randomID();
    return BlobGenerator(
      edgesCount: edgesCount,
      minGrowth: minGrowth,
      size: Size(size, size),
      id: randomID,
    ).generate();
  }

  String _randomID() {
    Blob.count++;
    if (id.length == 1) return id[0];
    return id[Blob.count % id.length];
  }
}

class _BlobState extends State<Blob> {
  BlobData blobData;
  BlobData fromBlobData;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _updateBlob();
    if (widget.loop) {
      timer = Timer.periodic(
        Duration(milliseconds: widget.duration.inMilliseconds),
        (_) => _updateBlob(),
      );
    } else if (widget.controller != null) {
      widget.controller.onChange(_updateBlob);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isAnimated) {
      return SimpleBlob(
        blobData: blobData,
        size: widget.size,
        styles: widget.styles,
        debug: widget.debug,
        child: widget.child,
      );
    }
    return AnimatedBlob(
      fromBlobData: fromBlobData,
      toBlobData: blobData,
      size: widget.size,
      styles: widget.styles,
      debug: widget.debug,
      duration: widget.duration,
      child: widget.child,
    );
  }

  BlobData _updateBlob() {
    if (widget.isAnimated) {
      fromBlobData = blobData;
    }
    blobData = widget._randomBlobData();
    setState(() {});
    return blobData;
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    if (widget.controller != null) widget.controller.dispose();
    super.dispose();
  }
}
