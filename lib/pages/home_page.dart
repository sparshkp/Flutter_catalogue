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
          ?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,),
             itemBuilder: (context, index){
              final item =CatalogueModel.items![index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                  ),
                child: GridTile(
                  child:Image.network(item.image),
                  header: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,

                    ),
                    child: Text(
                      item.name,style: TextStyle(
                        color: Colors.white
                        ),
                        ),
                  ),
                  footer: Text(
                    item.price.toString()),
                  ));
              
             },
             itemCount: CatalogueModel.items!.length,)
            :Center(
              child: CircularProgressIndicator(),
            ),
        ),
        drawer: MyDrawer(),
    );
      
  }
}