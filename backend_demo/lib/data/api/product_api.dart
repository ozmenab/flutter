import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    var url = Uri.parse("https://fakestoreapi.com/products");
    return http.get(url);
  }
}
