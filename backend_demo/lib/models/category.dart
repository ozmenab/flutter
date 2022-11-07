class Category {
  Category({
    required this.categoryName,
  });

  late String categoryName;

  Category.fromJson(String categoryName) {
    this.categoryName = categoryName;
  }

  Map toJson() {
    return {"category": categoryName};
  }
}
