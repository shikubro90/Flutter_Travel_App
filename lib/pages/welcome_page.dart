import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubits.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';
import 'package:flutter_travel_app/widgets/responsive_button.dart';


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
                  margin: const EdgeInsets.only(top: 100, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trips", size: 80, color: Colors.black54,),
                          AppText(
                            color: Colors.black45,
                            size: 80,
                            text: "Mountain",
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: AppText(
                                color: Colors.white,
                                size: 20,
                                text:
                                    "In the modified code, the required keyword is added to the String text and Color",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubit>(context).getData();
                            },
                            child: Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    ResponsiveButton(width: 120,),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children:
                          List.generate(3, (indexDots){
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              width: 8,
                              height: index==indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==indexDots? AppColors.mainColor : AppColors.mainColor.withOpacity(0.5)
                              ),
                            );
                          })
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
