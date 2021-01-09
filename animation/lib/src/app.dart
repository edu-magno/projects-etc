import 'package:flutter/material.dart';
import './screens/home.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(primaryColor: Colors.amber),
      home: Home(),
    );
  }
}
