import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final String title;
  final Widget child;
  const AppShell({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Color(0xff303952)),
        ),
      ),
      body: child,
    );
  }
}
