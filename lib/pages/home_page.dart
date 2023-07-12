import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:flutter_catalogue_1/widgets/drawer.dart';

import '../widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: (CatalogueModel.items!=null) && (CatalogueModel.items!.isNotEmpty) 
          ?ListView.builder(
            itemCount: CatalogueModel.items!.length,
            itemBuilder: (context, index){
              return ItemWidget(
                item: CatalogueModel.items![index],
                );
            }
            ):Center(
              child: CircularProgressIndicator(),
            ),
        ),
        drawer: MyDrawer(),
      );
  }
}