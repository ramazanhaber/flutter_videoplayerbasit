import 'package:flutter/material.dart';
import 'package:videoplayerbasit/ListVideo.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ListVideo(), // HomePage Single
    );
  }
}


