import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class BottomClipInspirationExample extends StatelessWidget {
  const BottomClipInspirationExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'BottomClip',
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // color: Colors.green,
              child: Blob.fromID(
                id: ['9-7-3291'],
                size: 300,
                styles: BlobStyles(
                  color: Color(0xffd1d8e0).withOpacity(0.5),
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              width: 300,
              child: ClipPath(
                clipper: MyClipper(),
                child: Image.asset(
                  "assets/phone.png",
                  alignment: Alignment.bottomCenter,
                  height: 310,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var blobData = BlobGenerator(
      id: '9-7-3291',
      size: size,
    ).generate();

    var sqPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height / 2));
    var blobPath = connectPoints(blobData.curves);

    return Path.combine(PathOperation.union, blobPath, sqPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
