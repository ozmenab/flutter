import 'package:bloc_sample/screens/cart_screen.dart';
import 'package:bloc_sample/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => const ProductListScreen(),
        "/cart": (BuildContext context) => const CartScreen(),
      },
      initialRoute: "/",
    );
  }
}
