

import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalogue.dart';
import '../themes.dart';
import 'catalogue_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogueModel.items![index];
        return InkWell
        (onTap: () => Navigator.push(
          context, MaterialPageRoute(
            builder:(context) => HomeDetailsPage(catalog: catalog)
            ,),
            ),
          child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.image),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.Bluishcolor).bold.make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
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
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}