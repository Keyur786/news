import 'package:flutter/material.dart';
import 'package:news/views/home_page.dart';

// 1d11357551204fc4a38e6820b21ab253

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "NewsApp",
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
      
  }
}
