

import 'package:flutter/material.dart';
import 'Controller/Api_Requests.dart';
import 'View/screens/HomePage.dart';
import 'models/convertModel.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }

}








