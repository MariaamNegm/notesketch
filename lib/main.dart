import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home:AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset("images/51p+drvQdpL.jpg",width:double.infinity, fit:BoxFit.cover,),
        nextScreen:homescreen(),
        //calling the page which have the tab bar view as next screen
        splashIconSize:double.infinity,
        //make the icon to cover all space around
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor:Colors.black87,
      )
    );
  }
}

