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
           color: Colors.red[100],
          child: Column(
            children: [
              _customWidget(text: "Screen 1"),
              _customWidget(text: "Screen 2"),
              _customWidget(text: "Screen 3"),
              _customWidget(text: "Screen 4"),
              _customWidget(text: "Screen 5"),
              _customWidget(text: "Screen 6"),
              _customWidget(text: "Screen 7"),
              _customWidget(text: "Screen 8"),
              _customWidget(text: "Screen 9"),
            ],
          ),
          ),
        ),
      ),

    );
  }
  Widget _customWidget({String? text , GestureTapCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin:const  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        padding:const  EdgeInsets.symmetric(horizontal: 13,vertical: 13),
        width: double.infinity,
        decoration: BoxDecoration(
         color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red),),
      ),
    );
  }
}
