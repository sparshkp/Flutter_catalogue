

import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/pages/home_page.dart';
import 'package:flutter_catalogue_1/pages/login_page.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: "/Login",
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoutes:(context) => HomePage(),
        MyRoutes.loginRoutes:(context) => LoginPage(),
      },
    );
  }
}