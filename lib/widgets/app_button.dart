import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String? text;
  IconData? icon;
  bool? isTrue;
  final Color color;
  final Color borderColor;
  final Color backGroundColor;
  double size;

  AppButton({
    Key? key,
    this.text,
    this.icon,
    this.isTrue = false,
    required this.color,
    required this.backGroundColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
                color: borderColor
          )
      ),

      child: Center(
          child: isTrue == false ? AppText(text: text!, size: 20, color: color,) : Icon(icon)),
    );
  }
}
