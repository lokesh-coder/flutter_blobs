import 'package:blobs/blobs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Color(0xffd2dae2),
                displayColor: Colors.pink,
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BasicExample(), // Examples() for all demo
    );
  }
}

class BasicExample extends StatelessWidget {
  const BasicExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    return Scaffold(
      appBar: AppBar(title: Text('Blobs Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Blob.random(
                size: 400,
                controller: blobCtrl,
              ),
            ),
            FlatButton(
              child: Text('Randomize'),
              onPressed: () {
                BlobData blobData = blobCtrl.change();
                print(blobData);
              },
            ),
          ],
        ),
      ),
    );
  }
}
