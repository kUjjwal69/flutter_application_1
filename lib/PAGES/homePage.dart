import 'package:flutter/material.dart';
import 'package:flutter_application_1/MODELS/catalog.dart';
import 'package:flutter_application_1/WIDGETS/item_widgets.dart';

import '../WIDGETS/drawers.dart';

class Homepage extends StatelessWidget {
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
        itemCount:dummyList.length, // Access the 'items' property in 'CatalogModel'.
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
            key: UniqueKey(),);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}