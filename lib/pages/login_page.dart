import 'package:flutter/material.dart';
import 'package:flutter_catalogue_1/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name =" ";
  bool changeButton =false;

  final _formkey =GlobalKey<FormState>();

  moveToHome(BuildContext context)async{
   if(_formkey.currentState!.validate()){
  setState(() {
  changeButton=true;
  });
  await Future.delayed(Duration(seconds: 1));
  await Navigator.pushNamed(context, MyRoutes.homeRoutes);
  setState(() {
  changeButton =false;
  });
                    
  }
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Username cannot be empty";
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Password cannot be empty";
                      }
                      else if (value.length <6) {
                        return "Password cannot be less than 6 characters";
                      }
                      return null;
                    }
                  ),
                  const SizedBox(
                  height: 40.0,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton? 20 :8),
                  child: InkWell(
                    onTap: () =>moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton? 50:150,
                      alignment: Alignment.center,
                      child: changeButton? Icon(Icons.done,color: Colors.white,):
                      Text("Login",style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white
                      )),
                      
                     
                    ),
                  ),
                )
                
                  ],),
                )
            ],
            
          ),
        ),
      )
    );
  }
}