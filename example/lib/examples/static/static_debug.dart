import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class StaticDebugExample extends StatelessWidget {
  const StaticDebugExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Debug',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 300,
                edgesCount: 8,
                minGrowth: 2,
                controller: blobCtrl,
                debug: true,
                styles: BlobStyles(color: Color(0xffd1d8e0)),
              ),
            ),
            // Button('Randomize', onTap: blobCtrl.change)
          ],
        ),
      ),
    );
  }
}
