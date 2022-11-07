import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListWidget extends StatefulWidget {
  late List<Product> products;

  ProductListWidget(List<Product> products, {Key? key}) : super(key: key) {
    this.products = products;
  }

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(widget.products.length, (index) {
          return Text(widget.products[index].productName);
        }),
      ),
    );
  }
}
