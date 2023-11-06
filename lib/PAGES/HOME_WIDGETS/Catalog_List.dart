import 'package:flutter/material.dart';
import 'package:flutter_application_1/MODELS/Catalog.dart';
import 'package:flutter_application_1/PAGES/Home_Detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final Catalog = CatalogModel.items[index];
        return InkWell(
          
  onTap: () =>  Navigator.push(
  context, MaterialPageRoute(builder: (context) => 
              HomeDeatilsPage(Catalog: Catalog))),

          child: CatalogItem(Catalog:Catalog));
      },
    );
  }
}



class CatalogItem extends StatelessWidget {
  final Item Catalog;
  const CatalogItem({
    Key? key,
    required this.Catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(Catalog.id.toString()),
            child: Image.network(
              Catalog.image
              ).box.make().p16().w40(context,),
          ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Catalog.name.text.lg.color(
                  const Color.fromARGB(255, 15, 1, 54)
                  ).make(),
                Catalog.desc.text.textStyle(
                  context.captionStyle)
                  .make(),
                  10.heightBox,
                ButtonBar(
                  alignment: 
                  MainAxisAlignment.spaceBetween,
                  buttonPadding: 
                 Vx.mH8,
                  children: [
                    "\$${Catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: (){},
                    
                    style: ButtonStyle(
                      backgroundColor: 
                      MaterialStateProperty.all
                      (const Color.fromARGB(255, 57, 20, 122)
                      ),
                      shape: MaterialStateProperty
                      .all(const StadiumBorder(),
                      )
                    )
                    , child: "Add to cart".text.make()
                    )
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
