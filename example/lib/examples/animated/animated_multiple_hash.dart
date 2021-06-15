import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class AnimatedMultipleHashExample extends StatefulWidget {
  const AnimatedMultipleHashExample({Key? key}) : super(key: key);

  @override
  _AnimatedMultipleHashExampleState createState() =>
      _AnimatedMultipleHashExampleState();
}

class _AnimatedMultipleHashExampleState
    extends State<AnimatedMultipleHashExample> {
  Color? clr;
  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Animated fixed blobs',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Blob.animatedFromID(
                  id: ['6-6-89116'],
                  styles: BlobStyles(
                    color: Color(0xff596275).withOpacity(0.5),
                    fillType: BlobFillType.stroke,
                    strokeWidth: 2,
                  ),
                  size: 50,
                ),
                Blob.animatedFromID(
                  id: ['6-6-157'],
                  size: 50,
                  styles: BlobStyles(
                    color: Color(0xff596275).withOpacity(0.5),
                    fillType: BlobFillType.stroke,
                    strokeWidth: 2,
                  ),
                ),
                Blob.animatedFromID(
                  id: ['6-6-774'],
                  size: 50,
                  styles: BlobStyles(
                    color: Color(0xff596275).withOpacity(0.5),
                    fillType: BlobFillType.stroke,
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              child: Blob.animatedFromID(
                id: ['6-6-89116', '6-6-157', '6-6-774'],
                size: 400,
                controller: blobCtrl,
                duration: Duration(seconds: 1),
                loop: true,
                styles: BlobStyles(color: Color(0xff34ace0)),
              ),
            ),
            // Button('Randomize', onTap: () {
            //   blobCtrl.change();
            // })
          ],
        ),
      ),
    );
  }
}
