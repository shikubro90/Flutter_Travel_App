import 'package:flutter/material.dart';
import 'package:flutter_travel_app/misc/colors.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu,size: 30,color: Colors.black54,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppText(text: "Discover", color: Colors.black45),
            ),
            const SizedBox(
              height: 30,
            ),
            // tabbar
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
                  indicator: CreateDotPaint(color: AppColors.mainColor, radius: 4),
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
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("Hi"),
                  Text("Hi"),
                  Text("Hi"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateDotPaint extends Decoration{

  final Color color;
  double radius;

  CreateDotPaint({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color: color, radius: radius);
  }
  
}

class CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // here paint is an object so we need to create pain object
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
  
}