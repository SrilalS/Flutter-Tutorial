import 'package:flutter/material.dart';
import 'package:tutorial/FCrud.dart';

import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with FireStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Fcrud(),
    );
  }
}