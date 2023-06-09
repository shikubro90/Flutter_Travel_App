import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final Color color;
  final String text;

  AppText(
      {Key? key,
      this.color = Colors.black12,
      required this.text,
      this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: this.size, color: color),
    );
  }
}
