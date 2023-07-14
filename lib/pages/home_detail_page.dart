import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalogue.dart';

class HomeDetailsPage extends StatelessWidget {
final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) :
  assert(catalog !=null)
  ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.red600.xl4.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyTheme.Bluishcolor,
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )),
                      child: "Buy".text.make(),
                    ).wh(100, 50)
                  ],
                ).pOnly(right: 8.0).p32(),
      ),
               appBar: AppBar(),
               backgroundColor: MyTheme.Creamcolor,
               body: SafeArea(
                bottom: false,
                child: Column(
                children: [
              Hero(
              tag: Key(catalog.image),
              child: Image.network(catalog.image)).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  edge: VxEdge.top,
                  arcType: VxArcType.convey,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.lg.color(MyTheme.Bluishcolor).xl4.bold.make(),
                       catalog.description.text.textStyle(context.captionStyle).xl.make(),
                      10.heightBox,
                      ],
                    ).py64(),
                  ),
                ),)
          ],),
      ),
    );
  }
}