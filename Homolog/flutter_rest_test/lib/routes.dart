import 'package:flutter/material.dart';
import 'package:flutter_rest_test/screens/home/home_screen.dart';
import 'package:flutter_rest_test/screens/login/login_screen.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
