import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Yap")),
      body: _SignInBody(),
    );
  }
}

class _SignInBody extends StatefulWidget {
  _SignInBody({Key? key}) : super(key: key);

  @override
  State<_SignInBody> createState() => __SignInBodyState();
}

class __SignInBodyState extends State<_SignInBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          _EmailPasswordForm(),
          _SignInProvider(
            infoText: "Google İle Giriş Yap",
            signInButton: SignInButton(
              Buttons.Google,
              text: "Google ile Giriş Yap",
              onPressed: () async {},
            ),
            signInMethod: () async {
              // TODO: Google İle Giriş
            },
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(Buttons.Facebook, onPressed: () {}, mini: true),
                  SignInButton(Buttons.Twitter, onPressed: () {}, mini: true),
                  SignInButton(Buttons.Tumblr, onPressed: () {}, mini: true),
                  SignInButton(Buttons.GitHub, onPressed: () {}, mini: true),
                  SignInButton(Buttons.LinkedIn, onPressed: () {}, mini: true),
                  SignInButton(Buttons.Microsoft, onPressed: () {}, mini: true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /*Widget _SignInProvider(String infoText, Buttons buttonType, Function signInMethod) {
    return 
  }*/
}

class _EmailPasswordForm extends StatefulWidget {
  _EmailPasswordForm({Key? key}) : super(key: key);

  @override
  State<_EmailPasswordForm> createState() => __EmailPassworFormState();
}

class __EmailPassworFormState extends State<_EmailPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text("Email ve Şifre ile Giriş Yap",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                //! Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "E-Mail"),
                  validator: (mail) {
                    if (mail!.isEmpty) return "Lütfen bir mail yazın";
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                //? Şifre
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Şifre"),
                  validator: (mail) {
                    if (mail!.isEmpty) return "Lütfen bir şifre yazın";
                    return null;
                  },
                  obscureText: true,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: SignInButton(Buttons.Email, onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // TODO: E-Mail ile Giriş Yap
                    }
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}

class _SignInProvider extends StatefulWidget {
  final String infoText;
  final Function signInMethod;
  final SignInButton signInButton;
  const _SignInProvider({
    Key? key,
    required this.infoText,
    required this.signInMethod,
    required this.signInButton,
  }) : super(key: key);

  @override
  State<_SignInProvider> createState() => __SignInProviderState();
}

class __SignInProviderState extends State<_SignInProvider> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Text(widget.infoText,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
                padding: const EdgeInsets.all(16.0), child: widget.signInButton)
          ],
        ),
      ),
    );
  }
}
