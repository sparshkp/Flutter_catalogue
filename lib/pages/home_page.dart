import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogue_1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:flutter_catalogue_1/store/store.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalogue_header.dart';
import '../widgets/home_widgets/catalogue_list.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

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
    final _cart =(VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation,RemoveMutation},
        builder: (context,store,status) =>FloatingActionButton(
          backgroundColor: MyTheme.bluishcolor,
          child: Icon(CupertinoIcons.cart),
          onPressed:() {
          Navigator.pushNamed(context, MyRoutes.cartRoutes);
        },).badge(
          color: MyTheme.creamcolor,
          count: _cart.items.length,
          size: 20,
          textStyle: TextStyle(
            color: MyTheme.bluishcolor,
            fontWeight: FontWeight.bold,
          )
        )
      ),
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

