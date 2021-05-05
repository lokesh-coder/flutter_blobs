import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class AnimatedStrokeExample extends StatelessWidget {
  const AnimatedStrokeExample({Key? key}) : super(key: key);

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
                size: 400,
                controller: blobCtrl,
                styles: BlobStyles(
                  color: Color(0xffcb2d3e),
                  fillType: BlobFillType.stroke,
                ),
              ),
            ),
            Button('Randomize', onTap: () {
              blobCtrl.change();
            })
          ],
        ),
      ),
    );
  }
}
