import 'package:flutter/material.dart';
import 'package:teacherday/utils/sharedPref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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
                onPressed: () async {
                  String email = txtEmail.text;
                  String password = txtPassword.text;

                  String? shrEmail = await getUserEmailSHR();
                  String? shrPassword = await getUserPasswordSHR();

                  if (email == shrEmail && password == shrPassword) {
                    isLogin(true);
                    Navigator.pushReplacementNamed(context, 'home');
                  }
                },
                child: Text("Login")),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'signUp');
                },
                child: Text("create new Account")),
          ],
        ),
      ),
    );
  }
}
