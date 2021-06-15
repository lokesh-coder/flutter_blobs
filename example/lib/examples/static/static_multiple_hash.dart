import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class StaticMultipleHashExample extends StatelessWidget {
  const StaticMultipleHashExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Static Basic',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.fromID(
                id: ['6-3-22556', '6-3-90151', '6-3-79206'],
                size: 300,
                controller: blobCtrl,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Blob.fromID(id: ['6-3-22556'], size: 50),
                Blob.fromID(id: ['6-3-90151'], size: 50),
                Blob.fromID(id: ['6-3-79206'], size: 50),
              ],
            ),
            SizedBox(height: 30),
            Button('Randomize', onTap: () {
              blobCtrl.change();
            })
          ],
        ),
      ),
    );
  }
}
