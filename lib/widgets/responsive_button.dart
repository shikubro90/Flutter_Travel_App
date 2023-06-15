import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double width;
  String? text;

  ResponsiveButton({Key? key, this.text, this.isResponsive=false, this.width=120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: isResponsive==true? EdgeInsets.symmetric(horizontal: 10):EdgeInsets.symmetric(horizontal: 0) ,
        width: isResponsive==true? double.maxFinite: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true ? AppText(text: text!, size: 20, color: Colors.white,) : Container(),
            Image.asset('assets/button-flutter.png')
          ],
        ),
      ),
    );
  }
}
