import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/dash/provider/dashProvider.dart';
import 'package:teacherday/screens/dash/view/dashScreen.dart';
import 'package:teacherday/screens/home/provider/homeProvider.dart';
import 'package:teacherday/screens/home/view/homeScreen.dart';
import 'package:teacherday/screens/home/view/homeScreenIos.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => DashProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "dash",
        routes: {
          '/': (context) => Homescreen(),
          'dash': (context) => DashScreen(),
        },
      ),
    ),
  );
}
