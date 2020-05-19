import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class AnimatedLoopExample extends StatelessWidget {
  const AnimatedLoopExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Loop animation',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.animatedRandom(
                size: 400,
                loop: true,
                edgesCount: 6,
                styles: BlobStyles(color: Color(0xffB33771)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
