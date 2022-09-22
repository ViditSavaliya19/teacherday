import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/home/view/homeScreen.dart';
import 'package:teacherday/screens/home/view/spleshScreen.dart';
import 'package:teacherday/screens/loginRegister/provider/loginRegister.dart';
import 'package:teacherday/screens/loginRegister/view/loginScreen.dart';
import 'package:teacherday/screens/loginRegister/view/registerScreen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>RegisterLoginProvider()),
        ChangeNotifierProvider(create: (context)=>RegisterLoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "data",
        routes: {
          '/': (context) => SpleshScreen(),
          'login': (context) => LoginScreen(),
          'signUp': (context) => RegisterScreen(),
          'home': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
