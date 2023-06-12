import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_large_text.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var Images = {
    'books.png': 'Books',
    'camera.png': 'Camera',
    'glass.png': 'Glass',
    'juice.png': "Juice",
    'maps.png': 'Maps'
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // menu bar
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppText(text: "Discover", color: Colors.black45),
            ),
            const SizedBox(
              height: 10,
            ),
            // tabbar menu
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicatorSize: TabBarIndicatorSize.label,
                  // labelStyle: TextStyle(fontSize: 15),
                  labelColor: Colors.black,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  indicator:
                      CreateDotPaint(color: AppColors.mainColor, radius: 4),
                  isScrollable: true,
                  tabs: const [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotion"),
                  ],
                ),
              ),
            ),
            // tabBarView
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15, top: 15),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage('assets/mountain-img.jpg'))),
                      );
                    },
                  ),
                  Text("Inspireation"),
                  Text("Emotion"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    size: 22,
                    color: AppColors.bigTextColor,
                  ),
                  AppText(
                    text: "See more",
                    color: AppColors.mainColor,
                    size: 15,
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            //margin: EdgeInsets.only(right: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/' +
                                        Images.keys.elementAt(index)))),
                          ),
                          AppText(
                            text: Images.values.elementAt(index),
                            size: 14,
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CreateDotPaint extends Decoration {
  final Color color;
  double radius;

  CreateDotPaint({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // here paint is an object so we need to create pain object
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
