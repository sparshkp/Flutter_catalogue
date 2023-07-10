import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name =" ";
  bool ChangeButton =false;
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
               Text("Welcome $name",
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
                  onChanged: (value) {
                    name=value;
                    setState(() {
                      
                    });
                  },
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
              InkWell(
                onTap: () async{
                  setState(() {
                  ChangeButton=true;
                  
                });
                await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRoutes.homeRoutes);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: ChangeButton? 50:150,
                  alignment: Alignment.center,
                  child: ChangeButton? Icon(Icons.done,color: Colors.white,):
                  Text("Login",style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  )),
                  
                  decoration: BoxDecoration(
                    shape: ChangeButton? BoxShape.circle :BoxShape.rectangle,
                    //borderRadius: BorderRadius.circular(ChangeButton? 20 :8),
                    color: Colors.deepPurple,
              
                  ),
                ),
              )
              /*ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoutes);
      
                }, child: Text("Login"),
                style: TextButton.styleFrom(minimumSize: Size(150, 40)),)*/
                ],),
              )
          ],
          
        ),
      )
    );
  }
}