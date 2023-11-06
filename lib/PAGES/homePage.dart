import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/PAGES/HOME_WIDGETS/Catalog_List.dart';
import 'package:flutter_application_1/PAGES/HOME_WIDGETS/Catalog_header.dart';
import 'package:flutter_application_1/UTILS/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/MODELS/Catalog.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
    await Future.delayed(const Duration(seconds: 2));
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
      floatingActionButton: FloatingActionButton(onPressed: () =>
       Navigator.pushNamed(context, MyRoutes.CartRoutes),
      backgroundColor: const Color.fromARGB(255, 38, 10, 85),
      child: Icon(CupertinoIcons.cart),),
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              const CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().py16().expand()
          ],
        ),
      ),
    ));
  }
}


