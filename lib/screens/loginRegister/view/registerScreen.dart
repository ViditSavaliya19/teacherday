import 'package:flutter/material.dart';
import 'package:teacherday/utils/sharedPref.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  createUser(txtEmail.text, txtPassword.text);
                  Navigator.pop(context);
                },
                child: Text("Sign up"))
          ],
        ),
      ),
    );
  }
}
