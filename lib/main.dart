import 'package:flutter/material.dart';
import 'package:flutter_zhihu/layout/main_layout.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '知乎Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainLayout(),
    );
  }
}
