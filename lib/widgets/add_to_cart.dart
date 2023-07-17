import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalogue.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  final _cart =CartModel();

   AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
        isInCart =isInCart.toggle();
        final _catalog =CatalogueModel();
         _cart.catalog =_catalog;
        _cart.add(catalog);
        // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.Bluishcolor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}