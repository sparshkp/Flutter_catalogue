import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';

class LoginPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg',
              fit: BoxFit.cover,),
              const SizedBox(
                height: 5.0,
              ),
              const Text("Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              )),
              
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoutes);
      
                }, child: Text("Login"),
                style: TextButton.styleFrom(minimumSize: Size(150, 40)),)
                ],),
              )
          ],
          
        ),
      )
    );
  }
}