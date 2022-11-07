import 'dart:convert';

import 'package:backend_demo/data/api/category_api.dart';
import 'package:backend_demo/models/category.dart';
import 'package:backend_demo/models/product.dart';
import 'package:backend_demo/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getCategoriesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alışveriş Sistemi"),
        centerTitle: true,
      ),
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoryWidgets,
            ),
          ),
          ProductListWidget(products: products)
        ],
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (var i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return OutlinedButton(
        onPressed: () {
          CategoryApi.getProductsByCategoryName(category.categoryName)
              .then((response) {
            setState(() {
              Iterable list = json.decode(response.body);
              products =
                  list.map((product) => Product.fromJson(product)).toList();
            });
          });
          print(products.length);
        },
        child: Text(category.categoryName));
  }
}
