import 'package:flutter_catalogue_1/models/catalogue.dart';
import 'package:flutter_catalogue_1/store/store.dart';
import 'package:velocity_x/velocity_x.dart';


class CartModel {
  // catalog field
  late CatalogueModel _catalogue;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogueModel get catalog => _catalogue;

  set catalog(CatalogueModel newCatalog) {
    _catalogue = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalogue.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
  class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}