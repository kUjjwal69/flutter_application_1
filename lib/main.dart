import 'package:flutter/material.dart';
import 'package:flutter_application_1/PAGES/homePage.dart';
import 'package:flutter_application_1/PAGES/login_page.dart';
import 'package:flutter_application_1/UTILS/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String value = "days of flutter";
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => const Homepage(),
        MyRoutes.HomeRoute: (context) => const Homepage(),
        MyRoutes.LoginRoute: (context) => LoginPage()
      },
    );
  }
}
