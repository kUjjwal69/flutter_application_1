import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/MODELS/catalog.dart';
import 'package:flutter_application_1/WIDGETS/item_widgets.dart';
import 'dart:convert';

import '../WIDGETS/drawers.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("ASSETS/files/catalog.json");
    var decodedJson = jsonDecode(catalogJson);
    var productsData = decodedJson["products"];
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(child: Text("Catalog App")),
      ),
      body: ListView.builder(
        itemCount:
            dummyList.length, // Access the 'items' property in 'CatalogModel'.
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
            key: UniqueKey(),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
