import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class AnimatedMultipleHashExample extends StatefulWidget {
  const AnimatedMultipleHashExample({Key key}) : super(key: key);

  @override
  _AnimatedMultipleHashExampleState createState() =>
      _AnimatedMultipleHashExampleState();
}

class _AnimatedMultipleHashExampleState
    extends State<AnimatedMultipleHashExample> {
  Color clr;
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
                Blob.animatedFromHash(
                  hash: ['6-3-22556'],
                  styles: BlobStyles(
                    color: Color(0xff596275).withOpacity(0.5),
                    fillType: BlobFillType.stroke,
                    strokeWidth: 2,
                  ),
                  size: 50,
                ),
                Blob.animatedFromHash(
                  hash: ['6-3-90151'],
                  size: 50,
                  styles: BlobStyles(
                    color: Color(0xff596275).withOpacity(0.5),
                    fillType: BlobFillType.stroke,
                    strokeWidth: 2,
                  ),
                ),
                Blob.animatedFromHash(
                  hash: ['6-3-79206'],
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
              child: Blob.animatedFromHash(
                hash: ['6-3-22556', '6-3-90151', '6-3-79206'],
                size: 400,
                controller: blobCtrl,
                styles: BlobStyles(color: Color(0xff34ace0)),
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
