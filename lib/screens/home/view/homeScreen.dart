import 'package:flutter/material.dart';
import 'package:teacherday/utils/sharedPref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              clearSHR();
              Navigator.pushReplacementNamed(context, 'login');
            },child: Text("Logout"),
          ),
        ),
      ),
    );
  }
}
