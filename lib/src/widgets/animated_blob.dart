import 'package:blobs/blobs.dart';
import 'package:blobs/src/models.dart';
import 'package:blobs/src/services/blob_generator.dart';
import 'package:blobs/src/widgets/simple_blob.dart';
import 'package:flutter/material.dart';

class AnimatedBlob extends StatefulWidget {
  final double size;
  final bool debug;
  final BlobStyles styles;
  final String hash;
  final BlobController ctrl;
  final Widget child;
  final Duration duration;
  final BlobData fromBlobData;
  final BlobData toBlobData;

  const AnimatedBlob({
    this.size = 200,
    this.fromBlobData,
    this.toBlobData,
    this.debug = false,
    this.styles,
    this.ctrl,
    this.hash,
    this.duration,
    this.child,
  });

  @override
  _AnimatedBlobState createState() => _AnimatedBlobState();
}

class _AnimatedBlobState extends State<AnimatedBlob>
    with SingleTickerProviderStateMixin {
  final List<List<Animation<double>>> _animations = [];
  final List<List<Tween<double>>> _tweens = [];
  AnimationController _animationController;
  List<List<int>> values = [];

  @override
  void didUpdateWidget(AnimatedBlob oldWidget) {
    setNewValue();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    values = List.generate(widget.toBlobData.dots.length,
        (index) => [widget.size ~/ 2, widget.size ~/ 2]);
    _animationController =
        AnimationController(duration: widget.duration, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    var curvAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
    values.forEach((v) {
      var t = [
        Tween(begin: 0.0, end: widget.toBlobData.coords.start.dx),
        Tween(begin: 0.0, end: widget.toBlobData.coords.start.dy),
        Tween(begin: 0.0, end: v[0].toDouble()),
        Tween(begin: 0.0, end: v[1].toDouble())
      ];
      _tweens.add(t);
      _animations.add([
        t[0].animate(curvAnimation),
        t[1].animate(curvAnimation),
        t[2].animate(curvAnimation),
        t[3].animate(curvAnimation)
      ]);
    });
    setNewValue();
  }

  setNewValue() {
    _tweens.asMap().forEach((i, tween) {
      tween[0].begin = tween[0].end;
      tween[0].end = widget.toBlobData.dots[i][0].dx;

      tween[1].begin = tween[1].end;
      tween[1].end = widget.toBlobData.dots[i][0].dy;

      tween[2].begin = tween[2].end;
      tween[2].end = widget.toBlobData.dots[i][1].dx;

      tween[3].begin = tween[3].end;
      tween[3].end = widget.toBlobData.dots[i][1].dy;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBlob(
      blobData: _getBlobData(),
      styles: widget.styles,
      debug: widget.debug,
      size: widget.size,
      child: widget.child,
    );
  }

  BlobData _getBlobData() {
    List<List<Offset>> dots = [];
    _animations.forEach((a) {
      dots.add(
          [Offset(a[0].value, a[1].value), Offset(a[2].value, a[3].value)]);
    });

    return BlobGenerator(
      edgesCount: widget.toBlobData.edgesCount,
      minGrowth: widget.toBlobData.minGrowth,
      size: Size(widget.size, widget.size),
    ).generate(
        dots, widget.toBlobData.innerRad, widget.toBlobData.originalSize);
  }

  @override
  void dispose() {
    if (widget.ctrl != null) widget.ctrl.dispose();
    super.dispose();
  }
}
