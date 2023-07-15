import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalogue_header.dart';
import '../widgets/home_widgets/catalogue_list.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int days=30;
   String name="Codepur";
    @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 2));
      var catalogueJson = await rootBundle.loadString("lib/assets/files/catalogue.json");
    final decodeData = jsonDecode(catalogueJson);
    var productsData =decodeData["products"];
    CatalogueModel.items =List.from(productsData)
    .map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
      
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.Bluishcolor,
        child: Icon(CupertinoIcons.cart),
        onPressed:() {
        Navigator.pushNamed(context, MyRoutes.cartRoutes);
      },),
        backgroundColor: context.cardColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                  CatalogList().expand()
                else
                    CircularProgressIndicator().centered().expand(),
                  
              ],
            ),
          ),
        ));
  }
}

