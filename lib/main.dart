

import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/pages/cart_page.dart';
import 'package:flutter_catalogue_1/pages/home_page.dart';
import 'package:flutter_catalogue_1/pages/login_page.dart';
import 'package:flutter_catalogue_1/store/store.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';
import 'package:flutter_catalogue_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main(){
  runApp(VxState(
    store: MyStore(),
    child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoutes:(context) => HomePage(),
        MyRoutes.loginRoutes:(context) => LoginPage(),
        MyRoutes.cartRoutes:(context) => CartPage(),
      },
    )
    ;
    
  }
}