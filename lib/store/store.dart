import 'package:flutter_catalogue_1/models/cart.dart';
import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogueModel catalog;
  late  CartModel cart;

  MyStore(){
   catalog =CatalogueModel();
   cart =CartModel();
   cart.catalog =catalog;
  }
}