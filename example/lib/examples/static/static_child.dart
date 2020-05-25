import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class StaticChildExample extends StatelessWidget {
  const StaticChildExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return AppShell(
      title: 'Blob with child',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 400,
                edgesCount: 6,
                minGrowth: 9,
                controller: blobCtrl,
                styles: BlobStyles(color: Color(0xff574b90)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Quote',
                          style: TextStyle(
                            fontSize: 33,
                            color: Color(0xfff78fb3),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'The most wasted of days is one without laughter.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Button('Randomize', onTap: () {
              var f = blobCtrl.change();
              print(f.id);
            })
          ],
        ),
      ),
    );
  }
}
