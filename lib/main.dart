

import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/pages/home_page.dart';
import 'package:flutter_catalogue_1/pages/login_page.dart';

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
      initialRoute: "/Home",
      routes: {
        "/":(context) => LoginPage(),
        "/Home":(context) => HomePage(),
        "/Login":(context) => LoginPage(),
      },
    );
  }
}