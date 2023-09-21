import 'package:flutter/material.dart';


main(){ runApp(const MaterialApp( 
title: "Fats Track", 
home: Login(),
));}

class Login extends StatelessWidget {
  const Login({super.key});

  @override

  
  Widget build(BuildContext context) {

    var MainLogo =Image.asset('Assets/images/Untitled-2.png');
    var Login    = TextButton(onPressed: null, child:  Container( alignment: Alignment.center, child: Text("Log In", style: TextStyle(color: Colors.black, fontSize: 15, letterSpacing: 4), ),width: 140, height: 35,), style: TextButton.styleFrom(backgroundColor: Colors.white), );
    var Sign_Up  =const OutlinedButton(onPressed: null, child: Text("Sign Up",),);

    var Button_Column=  Column(children: [Login, Sign_Up] ,);

    return  MaterialApp(
    home: Scaffold(
    backgroundColor: Colors.black,
    body: Center(child:  Container(child: Button_Column),), 





    ));}}