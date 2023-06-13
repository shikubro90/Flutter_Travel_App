import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenColor = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                child: Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/beautiful-landscape.jpg',
                      ),
                      fit: BoxFit.cover)),
            )),
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                )),
            Positioned(
                top: 330,
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
                        AppLargeText(text: 'Yosemite', color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: '\$250', color: AppColors.mainColor,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,size: 20,),
                        SizedBox(width: 5,),
                        AppText(text: "USA, California", size: 15, color: AppColors.textColor1,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children:
                            List.generate(5, (index){
                              return Icon(Icons.star, color: index<gottenColor?AppColors.startColor : AppColors.textColor2,);
                            })
                        ),
                        AppText(text: "(4.0)", size: 15,)
                      ],
                    ),
                    SizedBox(height: 25,),
                    AppLargeText(text: "People", size: 30, color: Colors.black.withOpacity(0.8),)
                  ],
                ),
                )
            )
          ],
        ),
      ),
    );
  }
}