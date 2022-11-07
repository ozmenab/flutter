import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alışveriş"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder<dynamic>(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildProductListItems(snapshot);
        } else {
          return const Center(child: Text("Data yok"));
        }
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    print("snapshot: " + snapshot.data.toString());
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, index) {
        var list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index], 1));
              }),
        );
      },
    );
  }
}
