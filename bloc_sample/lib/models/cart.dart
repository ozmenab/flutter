import 'package:bloc_sample/models/product.dart';

class Cart {
  late Product product;
  late int quantity;

  Cart(this.product, this.quantity);
}
