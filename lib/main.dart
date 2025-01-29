// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flowershop/shared/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Homepage(), 
      debugShowCheckedModeBanner: false, 
    );
  }
}

