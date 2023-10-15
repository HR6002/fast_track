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
                alignment: AlignmentDirectional(-0.0, -0.2),
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
                alignment: AlignmentDirectional(-0.0, -0.1),
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




class PasswordInputField extends StatefulWidget {
  final ValueChanged<String> onChanged; // Add onChanged property

  PasswordInputField({required this.onChanged});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, -0.1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Container(
          width: 320,
          child: TextFormField(
            autofocus: true,
            textInputAction: TextInputAction.go,
            obscureText: _obscurePassword,
            onChanged: widget.onChanged, // Use the onChanged property
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
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
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
  String email = ""; // Variable to store email
  String password = ""; // Variable to store password


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
                alignment: AlignmentDirectional(0.00, 0.14),
                child: TextButton(
                  onPressed: () async {

                String apiResponse = await loginAPI(email, password);
                print(apiResponse);
                },

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
                alignment: AlignmentDirectional(0.00, 0.35),
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
                alignment: AlignmentDirectional(0.00, -0.36),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Container(
                    width: 320,
                    child: TextFormField(
                      autofocus: true,
                      autofillHints: [AutofillHints.email],
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Type your Email Address ',
                        labelStyle:
                            TextStyle(
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
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(5),
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
                      
                      
                      onChanged: (value) {
                      setState(() {
                      email = value; 
                      });
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.72, -0.44),
                child: Text(
                  'Email Address ',
                  style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),
              PasswordInputField( onChanged: (value) {
      setState(() {
        password = value; // Update the 'password' variable with entered text
      });
    },),
              Align(
                alignment: AlignmentDirectional(-0.72, -0.18),
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
                alignment: AlignmentDirectional(0.00, -0.66),
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