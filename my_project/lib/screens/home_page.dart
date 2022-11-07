import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:my_project/screens/sign_in_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const FlutterLogo(size: 80),
          const SizedBox(height: 20),
          const Text("Üni Sosyal",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Column(
            children: [
              SignInButtonBuilder(
                backgroundColor: Colors.indigo,
                text: "Kayıt Ol",
                icon: Icons.person_add,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              SignInButtonBuilder(
                backgroundColor: Colors.amber,
                text: "Giriş Yap",
                icon: Icons.verified_user,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
