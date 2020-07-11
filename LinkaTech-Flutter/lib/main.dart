import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    ));
}

class MyApp extends StatefulWidget {
   _MyAppState createState() => _MyAppState();
}
  
  class _MyAppState extends State<MyApp> {
    
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                width: 128,
                height: 128,
                child: Image.asset("images/logo.png"),
              ),
            )
        );
  }
}