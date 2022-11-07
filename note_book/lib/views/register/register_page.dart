import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/sources/colors.dart';
import 'package:note_book/data/sources/strings.dart';
import 'package:note_book/views/login/login_page.dart';
import 'package:note_book/views/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  static const String routeName = '/views/register/register_page';

  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.isRegister.listen((isRegister) {
      if (isRegister) _goToLogin();
    });

    controller.error.listen((error) => _errorDialog());

    return Scaffold(
      appBar: AppBar(
        title: const Text(registerAppBarText),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildUserNameTextField(),
          _buildSpace(),
          _buildEmailTextField(),
          _buildSpace(),
          _buildBookTextField(),
          _buildSpace(),
          _buildPasswordTextField(),
          _buildSpace(),
          _buildPasswordVerifyTextField(),
          _buildSpace(),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildUserNameTextField() {
    return Material(
      color: white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(300),
          topRight: Radius.circular(10),
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

  Widget _buildEmailTextField() {
    return Material(
      color: white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: emailText,
          ),
        ),
      ),
    );
  }

  Widget _buildBookTextField() {
    return Material(
      color: white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.bookController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: bookText,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      color: white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.passwordController,
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordVerifyTextField() {
    return Material(
      color: white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(300),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          controller: controller.passwordVerifyController,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordVerifyText,
          ),
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(height: 20);
  }

  Widget _buildButton() {
    const double size = 45;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () => _ontap,
        child: const Text(registerText),
        style: ElevatedButton.styleFrom(primary: mainColor),
      ),
    );
  }

  void _ontap() {
    controller.callingRegisterService(
      controller.userNameController.text,
      controller.emailController.text,
      controller.bookController.text,
      controller.passwordController.text,
    );
  }

  void _goToLogin() {
    Get.toNamed(LoginPage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
}
