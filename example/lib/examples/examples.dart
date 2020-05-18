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

class Examples extends StatelessWidget {
  const Examples({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Examples',
      child: Container(
        child: ListView(
          children: [
            Link('Animated - Basic blob', AnimatedBasicExample()),
            Link('Animated-Basic with child', AnimatedChildExample()),
            Link('Animated-Debug', AnimatedDebugExample()),
            Link('Animated-Gradient', AnimatedGradientExample()),
            Link('Animated-Outline blob', AnimatedStrokeExample()),
            Link('Animated-Fixed blob', AnimatedHashExample()),
            Link('Animated-Fixed Multiple Hash', AnimatedMultipleHashExample()),
            Link('Animated-Custom color', AnimatedColorExample()),
            Link('Animated-Loop', AnimatedLoopExample()),
            Link(' Basic blob', StaticBasicExample()),
            Link('Basic with child', StaticBasicExample()),
            Link('Debug', StaticDebugExample()),
            Link('Gradient', StaticGradientExample()),
            Link('Outline blob', StaticGradientExample()),
            Link('Fixed blob', StaticHashExample()),
            Link('Fixed Multiple Hash', StaticHashExample()),
            Link('Custom color', StaticClipperExample()),
          ],
        ),
      ),
    );
  }
}
