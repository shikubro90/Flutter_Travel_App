import 'package:flutter/material.dart';
import 'package:flutter_travel_app/pages/detailes_page.dart';
import 'package:flutter_travel_app/pages/navpages/main_page.dart';
import 'package:flutter_travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainPage()
      home: DetailPage(),
    );
  }
}
