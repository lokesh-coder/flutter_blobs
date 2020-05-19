import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';

class AnimatedChildExample extends StatelessWidget {
  const AnimatedChildExample({Key key}) : super(key: key);

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
                styles: BlobStyles(color: Color(0xff182C61).withOpacity(0.05)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff182C61),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          // ignore: lines_longer_than_80_chars
                          'Circular challenges and opportunities outcomes; initiative dynamic, theory of change because program areas strengthening..',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff182C61).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
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
