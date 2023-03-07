import 'package:flutter/material.dart';
import 'package:pokemon_app/view/Main_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Widget build(BuildContext context) {
  bool check_light = true;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: check_light ? ThemeMode.light : ThemeMode.dark,
      home: Main_Page_View(
        check_Theme: (value) {
          setState(() {
            check_light = value;
          });
        },
      ),
    );
  }
}
