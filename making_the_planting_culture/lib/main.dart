import 'dart:async';
import 'package:flutter/material.dart';
import 'package:making_the_planting_culture/login.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "making_the_planting_culture",
      debugShowCheckedModeBanner: false,
      home:StartScreen(),

    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3),
        () =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage())),

    );
  }


  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child:
      Image.asset(width: MediaQuery.of(context).size.width*0.9,'assets/AppTtle.png')
      ),
    );
  }
}

