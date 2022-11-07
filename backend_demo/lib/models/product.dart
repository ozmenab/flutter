class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;

  Product.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    price = double.tryParse(json["price"].toString())!;
    description = json["description"];
    category = json["category"];
    image = json["image"];
  }

  Map toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image
    };
  }
}
