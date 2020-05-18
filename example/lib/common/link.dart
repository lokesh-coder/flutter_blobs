import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final Widget screen;
  const Link(this.text, this.screen);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
