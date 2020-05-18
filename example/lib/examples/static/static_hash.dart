import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class StaticHashExample extends StatelessWidget {
  const StaticHashExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Fixed Blob',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.fromHash(
                hash: [
                  'H4sIANhSwV4A/w3LsQ0AMQgEwYY24A5koBbr+2/jnY40NzdxBD7GPagXrznzKKlFbjSBJDKKs9QLE98PNkNQxj0AAAA='
                ],
                size: 400,
                controller: blobCtrl,
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
