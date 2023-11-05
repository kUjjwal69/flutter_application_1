import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/MODELS/Catalog.dart';
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
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("ASSETS/files/catalog.json");

    var decodedJson = jsonDecode(catalogJson);
    var productsData = decodedJson["products"];
    CatalogModel.items =
        List.from(productsData).map<Item>((e) => Item.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(child: Text("Catalog App")),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),

                 itemBuilder: (context, index){
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      ),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          (item.name),
                          style: TextStyle(color: Colors.white),
                        ),
                        
                        padding: const EdgeInsets.all(12),
                        
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),),
                      child: Image.network(
                        item.image,
                         ),
                      footer: Container(
                        child: Text(
                          (item.price.toString()
                          ),
                          style: TextStyle(
                            color: Colors.white
                            ),
                        ),
                        
                        padding: const EdgeInsets.all(12),
                        
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        ),
                    ),
                  );
                 },
                 itemCount: CatalogModel.items.length
                 )
              : Center(
                  child: CircularProgressIndicator(),
                )
                ),
      drawer: MyDrawer(),
    );
  }
}
/*
ListView.builder(
                  itemCount: CatalogModel.items
                      .length, // Access the 'items' property in 'CatalogModel'.
                  itemBuilder: (context, index) =>
                     ItemWidget(
                      item: CatalogModel.items[index],
                      key: UniqueKey(),
                    )
                    
                )*/
// 4:23:14