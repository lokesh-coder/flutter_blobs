import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class StaticStrokeExample extends StatelessWidget {
  const StaticStrokeExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Outline',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 400,
                controller: blobCtrl,
                styles: BlobStyles(
                  color: Color(0xffcb2d3e),
                  fillType: BlobFillType.stroke,
                ),
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
