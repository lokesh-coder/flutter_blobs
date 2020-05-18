import 'package:blobs/blobs.dart';
import '../../common/app_shell.dart';
import '../../common/button.dart';
import 'package:flutter/material.dart';

class StaticClipperExample extends StatefulWidget {
  const StaticClipperExample({Key key}) : super(key: key);

  @override
  _StaticClipperExampleState createState() => _StaticClipperExampleState();
}

class _StaticClipperExampleState extends State<StaticClipperExample> {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Clipper',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              child: ClipPath(
                clipper: BlobClipper(),
                child: Image.asset("assets/group.png"),
              ),
            ),
            Button('Randomize', onTap: () {
              setState(() {});
            })
          ],
        ),
      ),
    );
  }
}
