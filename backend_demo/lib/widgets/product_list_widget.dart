import 'package:backend_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {
  late List<Product> products = [];
  ProductListWidget({required this.products, Key? key}) : super(key: key);

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
        children: List.generate(
          widget.products.length,
          (index) {
            return Card(
                child: Column(
              children: [
                Image.network(
                  widget.products[index].image,
                  fit: BoxFit.cover,
                  height: 120,
                ),
                Expanded(child: Text(widget.products[index].title))
              ],
            ));
          },
        ),
      ),
    );
  }
}
