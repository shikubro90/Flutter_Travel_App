import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';
import 'package:flutter_travel_app/cubit/app_cubits.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_button.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';
import 'package:flutter_travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenColor = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state){
          DetailStates detailStates = state as DetailStates;
          // var detail = state.places;
          return Container(
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/'+detailStates.places.img,
                              ),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).goBack();
                          },
                          icon: Icon(Icons.backspace),
                          color: Colors.white,
                        )
                      ],
                    )),
                Positioned(
                    top: 260,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detailStates.places.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: '\$'+detailStates.places.price.toString(),
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detailStates.places.location,
                                size: 15,
                                color: AppColors.textColor1,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < gottenColor
                                          ? AppColors.startColor
                                          : AppColors.textColor2,
                                    );
                                  })),
                              AppText(
                                text: detailStates.places.stars.toString(),
                                size: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppLargeText(
                            text:  'People',
                            size: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppText(
                            text: 'Number of people in your group',
                            size: 20,
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: AppButton(
                                      text: (index + 1).toString(),
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : AppColors.mainColor,
                                      backGroundColor: selectedIndex == index
                                          ? AppColors.bigTextColor
                                          : AppColors.buttonBackground,
                                      borderColor: AppColors.buttonBackground,
                                      size: 50,
                                      isTrue: false,
                                      icon: Icons.favorite_outline,
                                    ));
                              })),
                          SizedBox(
                            height: 10,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text:
                            detailStates.places.description,
                            size: 15,
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        color: AppColors.textColor2,
                        backGroundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        size: 60,
                        isTrue: true,
                        icon: Icons.favorite_outline,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ResponsiveButton(text: "Book Trip Now", isResponsive: true)
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
