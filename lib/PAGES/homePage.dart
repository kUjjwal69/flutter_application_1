import 'package:flutter/material.dart';

import '../WIDGETS/drawers.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String value = "days of flutter";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days $value"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
