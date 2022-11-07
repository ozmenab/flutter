import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/sources/colors.dart';
import 'package:note_book/data/sources/images.dart';
import 'package:note_book/data/sources/strings.dart';
import 'package:note_book/views/login/login_controller.dart';
import 'package:note_book/views/register/register_page.dart';

class LoginPage extends GetWidget<LoginController> {
  static const String routeName = '/views/login/login_page';

  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginAppBarText),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSpace(),
            _buildImage(),
            _buildMaxSpace(),
            _userNameTextField(),
            _buildSpace(),
            _passwordTextFile(),
            _buildSpace(),
            _buildButton(),
            _buildSpace(),
            _buildRegisterText()
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(githubLogo, height: Get.height * .3);
  }

  Widget _userNameTextField() {
    return Material(
      color: white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(300),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.userNameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: userNameText,
          ),
        ),
      ),
    );
  }

  Widget _passwordTextFile() {
    return Material(
      color: white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(loginButton),
        style: ElevatedButton.styleFrom(primary: mainColor),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(height: 20.0);
  }

  Widget _buildRegisterText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: registerQuestionText,
            style: TextStyle(color: black, fontSize: 15),
          ),
          const TextSpan(text: ' '),
          TextSpan(
              text: registerButtonText,
              style: const TextStyle(
                  color: black, fontStyle: FontStyle.italic, fontSize: 15),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offNamed(RegisterPage.routeName);
                }),
        ],
      ),
    );
  }

  Widget _buildMaxSpace() {
    return const SizedBox(height: 40);
  }
}
