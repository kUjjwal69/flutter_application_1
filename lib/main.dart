import 'package:flutter/material.dart';
import 'package:flutter_application_1/PAGES/homePage.dart';
import 'package:flutter_application_1/PAGES/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String value = "days of flutter";
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/Login",
      routes: {
        "/": (context) => Homepage(),
        "/home": (context) => Homepage(),
        "/Login": (context) => LoginPage()
      },
    );
  }
}
