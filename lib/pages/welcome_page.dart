import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'travel-back-third.jpg',
    'travel-back-second.jpg',
    'travel-back-first.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        "assets/" + images[index]))),
                child: Container(
                  margin: EdgeInsets.only(top: 100, right: 20, left: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trips", size: 40),
                          AppText(
                            color: Colors.black45,
                            size: 40,
                            text: "Mountain",
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                              color: Colors.black,
                              size: 15,
                              text:
                                  "In the modified code, the required keyword is added to the String text and Color",
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
