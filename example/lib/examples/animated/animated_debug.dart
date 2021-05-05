import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class AnimatedDebugExample extends StatelessWidget {
  const AnimatedDebugExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Animated Basic',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.animatedRandom(
                size: 300,
                edgesCount: 6,
                minGrowth: 3,
                controller: blobCtrl,
                debug: true,
              ),
            ),
            Button('Randomize', onTap: blobCtrl.change)
          ],
        ),
      ),
    );
  }
}
