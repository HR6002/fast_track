import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http; 





main(){ runApp(const MaterialApp( 
title: "Fats Track", 
home: Main(),
));}



class Main extends StatelessWidget {
  const Main({super.key});

  @override

  
  Widget build(BuildContext context) {





    return  MaterialApp(
    home: Welcome_Screen()





    );}}

class  Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






class Welcome_Screen extends StatefulWidget {
  @override
  _Welcome_ScreenState createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  int _start = 4;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }


var hello = () async {
  var client = http.Client();
  try {
    var response = await client.get(Uri.parse('https://flutter.dev/'));
    print(response.body);
  } finally {
    client.close();
  }
};
  @override
  Widget build(BuildContext context) {
    var Main_signUp_Screen= Stack(
            children: [
              

              Align(

                alignment: AlignmentDirectional(0.00, 0.61),
                child: TextButton(
                  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const Login_page()),);},
                  child: Text('LOGIN', style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),),
                  style: TextButton.styleFrom(
                    minimumSize: Size(275, 40),
                    backgroundColor: Color(0xFFE0DBDB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                    ),
                    
                  
                ),
              ),),


              Align(
                alignment: AlignmentDirectional(0.00, 0.75),
                child: TextButton(
                  onPressed: () {
                    print(hello());
                  },
                  child: Text('SIGN UP', style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),),
                  style: TextButton.styleFrom(
                    minimumSize: Size(275, 40),
                    backgroundColor: Color(0xFF3F0679),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                    ),)),),


             Align(
                alignment: AlignmentDirectional(-1.30, -1.04),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'Assets/images/Logo.png',
                    width: 200,
                    fit: BoxFit.cover,
                  ),),),


              Align(
                alignment: AlignmentDirectional(-0.85, -0.48),
                child: Text(
                  'Hello!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 45,
                        letterSpacing: 1.5,
                      ),),),

              Align(
                alignment: AlignmentDirectional(-0.78, -0.29),
                child: Text(
                  'Welcome,',
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 45,
                      ),),),            
            
              Align(
                alignment: AlignmentDirectional(0.08, 0.44),
                child: Text(
                  'A world of effortless travel \nand adventure is waiting for you ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF848181),
                      ),),),
            ],
          );

    var MainLogo =Image.asset('Assets/images/Logo_animated.gif', height: 440, fit: BoxFit.cover,);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(

          children: <Widget>[



            Visibility(
              child: MainLogo,
             visible: _start > 1 && _start <= 4 ? true : false,
            ),
          



            Visibility(
              child: Main_signUp_Screen,
              visible: _start == 0 ? true : false,
            ),




          ],
        ),
      ),
    );
  }
}










class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool isError = false;
  String email = ""; // Variable to store email
  String password = ""; // Variable to store password
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  bool _obscurePassword =true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }


  @override
  Widget build(BuildContext context) {



Future<String> loginAPI(String username, String password) async {
  var client = http.Client();
  try {
    var apiUrl = Uri.parse('http://127.0.0.1:8000/login_request?username=$username&password=$password');

    var response = await client.get(apiUrl);
    return response.body;
  } finally {
    client.close();
  }
}






var main_stack= Stack(children: [
    

                  
                  
                  
                  
              Align(
                alignment: AlignmentDirectional(0.00, -0.1),
                child: TextButton(
                  onPressed: () async {
                  if (_formKey.currentState != null && _formKey.currentState!.validate() || _formKey1.currentState != null && _formKey1.currentState!.validate()) {
                    
                    String apiResponse = await loginAPI(email, password);
                    print("api response is: $apiResponse");
                    if (apiResponse == 'false') {
                      setState(() {
                        isError = true; 
                        print("isError variable is: $isError");
                      });
                    } else {
                     
                        print("isError variable is: $isError");
                      
                    }

                    if (_formKey.currentState!.validate() || _formKey1.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("processing Data")),
                      );
                    }
                  }
                  print("button has been pressed");

                 
                }

                ,




                  child: Text('LOGIN', style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),),
                  style: TextButton.styleFrom(
                    minimumSize: Size(275, 40),
                    backgroundColor: Color(0xFFE0DBDB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                    ),),),),
                  



              Align(
                alignment: AlignmentDirectional(0.00, 0.03),
                child: OutlinedButton(
                  onPressed: () {
                    print("sign up button pressed");
                  },
                  child: Text('Dont Have Account?  -Sign Up', style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 9.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(275, 40),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                    ),)),),
    
                    Align(
                      alignment: AlignmentDirectional(0.00, -0.60),
                      child: Form(
                        key: _formKey1,
                        autovalidateMode: isError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 320,
                            child: TextFormField(
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Fill in the form correctly!";
                              }
                              else if (isError) {
                                return "Email address or password is incorrect";
                              }


                              return null;
                            },
                             onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                                if (isError){
                                 setState(() {
                                isError = false; 
                        
                      });}
                              },
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Type your Email Address ',
                                labelStyle: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF7B7B7B),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: isError ? Colors.red : Colors.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: isError ? Colors.red : Colors.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,

                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.72, -0.68),
                      child: Text(
                        'Email Address ',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),

              Align(
                alignment: AlignmentDirectional(-0.72, -0.68),
                child: Text(
                  'Email Address ',
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),

Align(
      alignment: AlignmentDirectional(0.00, -0.34),
      child:  Form ( 
        key: _formKey, 
        autovalidateMode: isError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
        child:
      
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Container(
          width: 320,
          
          child: TextFormField(
            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Fill in the form correctly!";
                              }
                              if (isError) {
                                return "Email address or password is incorrect";
                              }
                              return null;
                            },

            autofocus: true,
            textInputAction: TextInputAction.go,
            obscureText: _obscurePassword,
            onChanged: (value) {
                                setState(() {
                                  password = value;
                                });

                                if (isError){
                                 setState(() {
                        isError = false; 
                        
                      });}

                              }, 
            decoration: InputDecoration(
              labelText: 'Type Your Password',
              labelStyle: TextStyle(
                fontFamily: 'Readex Pro',
                color: Color(0xFF7B7B7B),
              ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isError? Colors.red: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isError? Colors.red: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: Colors.white,
            size: 25,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        
          hintStyle: TextStyle(color: Colors.white),
        
          //labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white), 
       
      ),
    ),
      )),
),
              Align(
                alignment: AlignmentDirectional(-0.82, -0.42),
                child: Text(
                  'Password',
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -0.9),
                child: Text(
                  'Login',
                  style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                ),
              ),
            ],
          );


    return Scaffold(backgroundColor: Colors.black, body: main_stack,);
  }
































































}