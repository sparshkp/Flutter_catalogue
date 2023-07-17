import 'package:flutter_catalogue_1/models/catalogue.dart';


class CartModel {
  // catalog field
  late CatalogueModel _catalogue;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogueModel get catalog => _catalogue;

  set catalog(CatalogueModel newCatalog) {
    assert(newCatalog != null);
    _catalogue = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalogue.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}