import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class StaticBasicExample extends StatelessWidget {
  const StaticBasicExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Basic Shape',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 400,
                edgesCount: 5,
                minGrowth: 7,
                controller: blobCtrl,
                debug: true,
              ),
            ),
            Button('Randomize', onTap: () {
              BlobData blobData = blobCtrl.change();
              print('${blobData.id}');
            })
          ],
        ),
      ),
    );
  }
}
