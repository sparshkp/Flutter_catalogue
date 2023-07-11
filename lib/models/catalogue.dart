class CatalogueModel{
   static final items =[Item(
   id: 1,
   name: "iPhone 12 Pro",
   description: "Apple iPhone 12th generation",
   price: 999,
   color: "#33505a",
   image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
   ];
}


class Item{
  final int id;
  final String description;
  final String name;
  final String color;
  final String image;
  final num price;

  Item({required this.id, required this.description, required this.name, required this.color, required this.image, required this.price});
  
}