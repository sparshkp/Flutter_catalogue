import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Sparsh Kapoor"),
                 accountEmail: Text("kasparsh4@gmail.com"),
                 currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C5603AQF4JMbcOtYzoQ/profile-displayphoto-shrink_800_800/0/1610887853520?e=1694649600&v=beta&t=axCAuaNYPgH_5D_sz-8z2fkAKeeXOFS_0J6eRa_a-7k"),
                 ),
                 
                 ),),
                 ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                    ),
                  title: Text("Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                  color: Colors.white,
                  ),),
                 ),
                 ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                    ),
                  title: Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                  color: Colors.white,
                  ),),
                 ),
                 ListTile(
                  leading: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.white,
                    ),
                  title: Text("Cart",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                  color: Colors.white,
                  ),),
                 )
          ],
        ),
      ),
    );
  }
}