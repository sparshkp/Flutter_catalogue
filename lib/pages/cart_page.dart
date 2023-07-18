
import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/models/cart.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';
class CartPage extends StatelessWidget {
const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.make(),
      ),
      backgroundColor: MyTheme.creamcolor,
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
   const Carttotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart =(VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          VxBuilder(
            mutations: const {RemoveMutation},
            builder:(context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(MyTheme.bluishcolor)
                  .make();
              
            },
          ),

          30.widthBox,
         ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: "Buting not supported yet".text.make(),
              )
              );
          },
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(MyTheme.bluishcolor) ,), 
          child: "Buy".text.white.make()).w32(context)
        ],
        ),
    );
  }
}
class CartList extends StatelessWidget{
  const CartList({super.key});

  
  
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on :[RemoveMutation]);
    final CartModel _cart =(VxState.store as MyStore).cart;
    return  _cart.items.isEmpty? "Nothing to show".text.xl3.make().centered():ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=> ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){
            RemoveMutation(_cart.items[index]);
           // setState(() {});
          }, 
          icon: Icon(Icons.remove_circle_outline)),
          title: _cart.items[index].name.text.make(),
      ));
  }
}