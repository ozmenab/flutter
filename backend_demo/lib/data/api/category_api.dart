import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    var url = Uri.parse("https://fakestoreapi.com/products/categories");
    return http.get(url);
  }

  static Future getProductsByCategoryName(String categoryName) {
    var url =
        Uri.parse("https://fakestoreapi.com/products/category/${categoryName}");
    return http.get(url);
  }
}
