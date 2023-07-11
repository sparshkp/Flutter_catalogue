import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:flutter_catalogue_1/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
   int days=30;
   String name="Codepur";

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: CatalogueModel.items.length,
            itemBuilder: (context, index){
              return ItemWidget(
                item: CatalogueModel.items[index],
                );
            }
            ),
        ),
        drawer: MyDrawer(),
      );
  }
}