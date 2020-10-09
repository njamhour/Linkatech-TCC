import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/landing_page.dart';
import 'package:linkatech_ff/services/auth.dart';
import 'package:provider/provider.dart';
// import 'package:linkatech_ff/app/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'LinkaTech',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}
