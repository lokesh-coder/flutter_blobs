import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const Button(this.label, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: FlatButton(
        color: Color(0xff303952),
        onPressed: onTap,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
