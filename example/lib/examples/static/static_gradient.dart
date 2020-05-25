import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class StaticGradientExample extends StatelessWidget {
  const StaticGradientExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Gradient',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 400,
                controller: blobCtrl,
                styles: BlobStyles(
                  gradient: LinearGradient(
                    colors: [Color(0xffe96443), Color(0xff904e95)],
                  ).createShader(Rect.fromLTRB(0, 0, 300, 300)),
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
