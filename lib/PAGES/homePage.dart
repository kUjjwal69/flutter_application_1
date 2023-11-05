import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/MODELS/Catalog.dart';

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
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(Color.fromARGB(255, 37, 15, 98))
            .make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final Catalog = CatalogModel.items[index];
        return CatalogItem(Catalog:Catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog;
  const CatalogItem({
    Key? key,
    required this.Catalog,
  }) : assert(Catalog!= null), super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(
            Catalog.image).box.make().p16().w40(context,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Catalog.name.text.lg.color(Color.fromARGB(255, 15, 1, 54)).make(),
                Catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${Catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: (){},
                    
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all
                      (Color.fromARGB(255, 57, 20, 122)),
                      shape: MaterialStateProperty.all(StadiumBorder(),)
                    )
                    , child: "Buy".text.make())
                  ],
                )
              ],
              )
              )
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}
