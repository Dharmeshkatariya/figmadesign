import 'package:figmadesign/common.dart';
import 'package:figmadesign/screen1/screen1page.dart' show ScreenPage;
import 'package:figmadesign/screen10/screen10page.dart';
import 'package:figmadesign/screen11/screen11page.dart';
import 'package:figmadesign/screen12/scren12page.dart';
import 'package:figmadesign/screen13/screen13page.dart';
import 'package:figmadesign/screen14/screen14page.dart';
import 'package:figmadesign/screen15/visitingpage.dart';
import 'package:figmadesign/screen2/screen2page.dart';
import 'package:figmadesign/screen3page/screen3page.dart';
import 'package:figmadesign/screen4.dart';
import 'package:figmadesign/screen5/screen5.dart';
import 'package:figmadesign/screen6/screen6.dart';
import 'package:figmadesign/screen7/reviewpage.dart';
import 'package:figmadesign/screen8/screen8.dart';
import 'package:figmadesign/screen9/foodpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              Common.navigatePage(text: "Screen 1",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 2",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenSecondPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 3",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 4",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenFourPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 5",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenFive()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 6",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 7",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 8",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MultiPlane()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 9",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodScreenPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 10",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodOderPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 11",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrillFoodPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 12",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutmePage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 13",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HousePage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 14",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClothesPage()),
                );
              }
              ),
              Common.navigatePage(text: "Screen 15",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VisitorPage()),
                );
              }
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }

}
