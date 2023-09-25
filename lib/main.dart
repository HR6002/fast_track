import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http; 





main(){ runApp(const MaterialApp( 
title: "Fats Track", 
home: Main(),
));}


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
                  onPressed: () {
                    print('Main Button pressed ...');
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
















class Login {
  Future<void> fetchFlutterDev() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('https://flutter.dev/'));
      print(response.body);
    } finally {
      client.close();
    }
  }
}
































class Main extends StatelessWidget {
  const Main({super.key});

  @override

  
  Widget build(BuildContext context) {





    return  MaterialApp(
    home: Welcome_Screen()





    );}}





















    