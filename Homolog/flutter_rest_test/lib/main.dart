import 'package:flutter/material.dart';
// import 'auth.dart';
import 'package:flutter_rest_test/routes.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
    );
  }
}