import 'package:example/examples/static/static_child.dart';
import 'package:example/examples/static/static_color.dart';
import 'package:example/examples/static/static_multiple_hash.dart';
import 'package:example/examples/static/static_stroke.dart';
import 'package:flutter/material.dart';
import '../common/app_shell.dart';
import '../common/link.dart';
import 'animated/animated_basic.dart';
import 'animated/animated_child.dart';
import 'animated/animated_color.dart';
import 'animated/animated_debug.dart';
import 'animated/animated_gradient.dart';
import 'animated/animated_hash.dart';
import 'animated/animated_multiple_hash.dart';
import 'animated/animated_stroke.dart';
import 'animated/annimated_loop.dart';
import 'static/static_basic.dart';
import 'static/static_clipper.dart';
import 'static/static_debug.dart';
import 'static/static_gradient.dart';
import 'static/static_hash.dart';
import 'inspirations/rotate.dart';
import 'inspirations/frame.dart';
import 'inspirations/bottomclip.dart';

class Examples extends StatelessWidget {
  const Examples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Examples',
      child: Container(
        child: ListView(
          children: [
            Link('Insipation - rotate', RotateInpirationExample()),
            Link('Insipation - frame', FrameInspirationExample()),
            Link('Insipation - bottomclip', BottomClipInspirationExample()),
            Link('Animated - Basic blob', AnimatedBasicExample()),
            Link('Animated-Basic with child', AnimatedChildExample()),
            Link('Animated-Debug', AnimatedDebugExample()),
            Link('Animated-Gradient', AnimatedGradientExample()),
            Link('Animated-Outline blob', AnimatedStrokeExample()),
            Link('Animated-Fixed blob', AnimatedHashExample()),
            Link('Animated-Fixed Multiple Hash', AnimatedMultipleHashExample()),
            Link('Animated-Custom color', AnimatedColorExample()),
            Link('Animated-Loop', AnimatedLoopExample()),
            Link('Basic blob', StaticBasicExample()),
            Link('Basic with child', StaticChildExample()),
            Link('Debug', StaticDebugExample()),
            Link('Gradient', StaticGradientExample()),
            Link('Outline blob', StaticStrokeExample()),
            Link('Fixed blob', StaticHashExample()),
            Link('Fixed Multiple Hash', StaticMultipleHashExample()),
            Link('Custom color', StaticColorExample()),
            Link('Clipper', StaticClipperExample()),
          ],
        ),
      ),
    );
  }
}
