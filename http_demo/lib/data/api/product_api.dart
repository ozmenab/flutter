import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() async {
    var url = Uri.parse("http://10.0.2.2:3000/products");
    return await http.get(url);
  }

  static Future getProductsByCategoryId(int categoryId) async {
    var url = Uri.parse("http://10.0.2.2:3000/products?categoryId=$categoryId");
    return await http.get(url);
  }
}
