import 'package:flutter/material.dart';

import '../models/catalogue.dart';

class ItemWidget extends StatelessWidget {
  
  final Item item;

  const ItemWidget({super.key, required this.item})
   // ignore: unnecessary_null_comparison
   :assert (item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
          ),),
      ),
    );
  }
}