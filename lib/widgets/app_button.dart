import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final icon;
  final borderRadius;
  final backGroundColor;

  const AppButton({
    Key? key,
    this.icon,
    this.text,
    this.backGroundColor,
    this.borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(text!)),
    );
  }
}
