import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/routing/get_pages.dart';
import 'data/get_controllers.dart';
import 'views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future main() async {
    await getControllers();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: const LoginPage(),
    );
  }
}
