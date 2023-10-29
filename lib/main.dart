import 'package:flutter/material.dart';
import 'package:flutter_application_1/PAGES/homePage.dart';
import 'package:flutter_application_1/PAGES/login_page.dart';
import 'package:flutter_application_1/UTILS/routes.dart';

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
        MyRoutes.HomeRoute: (context) => Homepage(),
        MyRoutes.LoginRoute: (context) => LoginPage()
      },
    );
  }
}
