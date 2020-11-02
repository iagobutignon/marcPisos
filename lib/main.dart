import 'package:flutter/material.dart';
import 'home/home.dart';


void main() {
  runApp(MaterialApp(
      title: "Marc Pisos",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
      }));
}
