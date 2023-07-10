import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/widgets/drawer.dart';

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
        body: Center(
          child: Container(
          child:  Text("Welcome to $days days of flutter by $name"),
            ),
        ),
        drawer: MyDrawer(),
      );
  }
}