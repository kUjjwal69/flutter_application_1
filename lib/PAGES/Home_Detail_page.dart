import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/MODELS/Catalog.dart';

class HomeDeatilsPage extends StatelessWidget {
  final Item Catalog;
  const HomeDeatilsPage({
    Key? key,
    required this.Catalog,
  })  : assert(Catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
                    alignment: 
                    MainAxisAlignment.spaceBetween,
                    buttonPadding: 
                   Vx.mH8,
                    children: [
                      "\$${Catalog.price}".text.bold.xl4.red800.make(),
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
                      , child: "Buy".text.make()
                      ).wh(100,50)
                    ],
                  ).p32(),
        ),
        body: SafeArea(
          child: Column(
            children: [Hero(
              tag: Key(Catalog.id.toString()),
              child: Image.network(Catalog.image)).h32(context),
             Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
               child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                 children: [
                   Catalog.name.text.xl4.color(
                  const Color.fromARGB(255, 15, 1, 54)
                  ).make(),
                Catalog.desc.text.textStyle(
                  context.captionStyle).xl
                  .make(),
                  10.heightBox,
                 ],
                ).py64(),
               ),
             ))
                  ],
          ),
        ));
  }
}
