class CatalogueModel{
   static List<Item> ?items;
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
