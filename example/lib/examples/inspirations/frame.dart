import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class FrameInspirationExample extends StatelessWidget {
  const FrameInspirationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Frame',
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Blob.fromID(
              size: 300,
              styles: BlobStyles(
                fillType: BlobFillType.stroke,
                strokeWidth: 6,
                gradient: LinearGradient(
                        colors: [Color(0xffe96443), Color(0xff904e95)])
                    .createShader(Rect.fromLTRB(0, 0, 300, 300)),
              ),
              id: ['9-6-38406'],
            ),
            Container(
              width: 270,
              child: ClipPath(
                clipper: BlobClipper(
                  id: '9-6-38406',
                ),
                child: Image.asset("assets/group.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
