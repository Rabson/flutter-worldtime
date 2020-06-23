import 'package:flutter/material.dart';
import 'package:flutterworldtime/pages/choose_location.dart';
import 'package:flutterworldtime/pages/home.dart';
import 'package:flutterworldtime/pages/loading.dart';

void main() => runApp(MaterialApp(
 initialRoute: '/',
  routes: {
    '/' :(context) => Loading(),
    '/home': (context) => Home(),
    '/location' :(context) => ChooseLocation()
  },
));
