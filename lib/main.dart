import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/navigation.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationScreen(),
    );
  }
}
