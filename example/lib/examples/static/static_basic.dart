import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import 'package:flutter/material.dart';

class StaticBasicExample extends StatelessWidget {
  const StaticBasicExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Random Blob Shapes',
      child: Center(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 12,
          itemBuilder: (ctx, index) {
            return Center(
              child: Blob.random(
                size: 100,
                edgesCount: 6,
                minGrowth: 7,
                controller: blobCtrl,
                styles: BlobStyles(color: Color(0xffd1d8e0)),
                // debug: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

// Button('Randomize', onTap: () {
//   BlobData blobData = blobCtrl.change();
//   print('${blobData.id}');
// })
