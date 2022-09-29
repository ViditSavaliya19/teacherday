import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/home/view/homeScreen.dart';
import 'package:teacherday/screens/home/view/spleshScreen.dart';
import 'package:teacherday/screens/inappweb/browerScreen.dart';
import 'package:teacherday/screens/inappweb/webProvider.dart';
import 'package:teacherday/screens/loginRegister/provider/loginRegister.dart';
import 'package:teacherday/screens/loginRegister/view/loginScreen.dart';
import 'package:teacherday/screens/loginRegister/view/registerScreen.dart';
import 'package:teacherday/screens/userScreen/userDataScreen.dart';
import 'package:teacherday/screens/userScreen/userProvider.dart';
import 'package:teacherday/screens/webView/webScreen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>RegisterLoginProvider()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>WebProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "webbrowser",
        routes: {
          '/': (context) => UserDataScreen(),
          'login': (context) => LoginScreen(),
          'signUp': (context) => RegisterScreen(),
          'home': (context) => HomeScreen(),
          'web': (context) => WebScreen(),
          'webbrowser': (context) => WebBrowserScreen(),
        },
      ),
    ),
  );
}
