
import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/models/cart.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.make(),
      ),
      backgroundColor: MyTheme.Creamcolor,
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          Carttotal(),
        ],
      ),
    );
  }
}
class Carttotal extends StatelessWidget {
   Carttotal({super.key});
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
         "\$${_cart.totalPrice}".text.xl5.color(MyTheme.Bluishcolor).make(),
         30.widthBox,
         ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: "Buting not supported yet".text.make(),
              )
              );
          },
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(MyTheme.Bluishcolor) ,), 
          child: "Buy".text.white.make()).w32(context)
        ],
        ),
    );
  }
}
class CartList extends StatelessWidget{
  final _cart = CartModel();
  
  @override
  Widget build(BuildContext context) {
    return  _cart.items.isEmpty? "Nothing to show".text.xl3.make().centered():ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=> ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){
            _cart.remove(_cart.items[index]);
           // setState(() {});
          }, 
          icon: Icon(Icons.remove_circle_outline)),
          title: _cart.items[index].name.text.make(),
      ));
  }
}