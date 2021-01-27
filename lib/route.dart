
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kensa/screen/home.dart';
import 'package:kensa/screen/login.dart';
import 'package:provider/provider.dart';

class Routes{
  static Map<String, WidgetBuilder> getAll() => _routes;
  static final Map<String, WidgetBuilder> _routes = {
    "/home": (context) => HomeScreen(),
    "/login": (context) => LoginScreen(),
  };


}
