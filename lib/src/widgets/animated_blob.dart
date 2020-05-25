import 'package:blobs/blobs.dart';
import 'package:blobs/src/models.dart';
import 'package:blobs/src/services/blob_animator.dart';
import 'package:blobs/src/services/blob_generator.dart';
import 'package:blobs/src/widgets/simple_blob.dart';
import 'package:flutter/material.dart';

class AnimatedBlob extends StatefulWidget {
  final double size;
  final bool debug;
  final BlobStyles styles;
  final String id;
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
    this.id,
    this.duration,
    this.child,
  });

  @override
  _AnimatedBlobState createState() => _AnimatedBlobState();
}

class _AnimatedBlobState extends State<AnimatedBlob>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  BlobAnimator animator;
  BlobData data;

  @override
  void didUpdateWidget(AnimatedBlob oldWidget) {
    setNewValue();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: widget.duration, vsync: this);
    animator = BlobAnimator(
        animationController: _animationController,
        pathPoints: widget.toBlobData.points.destPoints);
    animator.init((o) {
      setState(() {
        data = BlobGenerator(
          edgesCount: widget.toBlobData.edges,
          minGrowth: widget.toBlobData.growth,
          size: Size(widget.size, widget.size),
        ).generateFromPoints(o);
      });
    });
    setNewValue();
  }

  setNewValue() {
    animator.morphTo(widget.toBlobData.points.destPoints);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBlob(
      blobData: data,
      styles: widget.styles,
      debug: widget.debug,
      size: widget.size,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    if (widget.ctrl != null) widget.ctrl.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
