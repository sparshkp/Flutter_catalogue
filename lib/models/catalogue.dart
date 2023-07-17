class CatalogueModel{

  static final catModel = CatalogueModel._internal();

  CatalogueModel._internal();
   
   factory CatalogueModel()=> catModel;
   static List<Item> ?items;

   // get item by id
    Item getById(int id) => items!.firstWhere((element) => element.id ==id, orElse: null);

   // get item by position
     Item getByPosition(int pos) =>items![pos];

  void add(Item catalog) {}

}


class Item{
  final int id;
  final String description;
  final String name;
  final String color;
  final String image;
  final num price;

  Item({required this.id,  required this.description, required this.name, required this.color, required this.image, required this.price});
   factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      description: map["description"],
      name: map["name"],
      color: map["color"],
      image: map["image"],
      price: map["price"],
    );
   }
    toMap() => {
      "id": id,
      "description": description,
      "name": name,
      "color": color,
      "image": image,
      "price": price,

    };
   }
