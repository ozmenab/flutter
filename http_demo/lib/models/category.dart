class Category {
  late int id;
  late String categoryName;
  late String seoUrl;

  Category(this.id, this.categoryName, this.seoUrl);

  Category.fromJson(Map json) {
    id = json["id"];
    categoryName = json["categoryName"];
    seoUrl = json["seoUrl"];
  }
  Map toJson() {
    return {
      "id": id,
      "categoryName": categoryName,
      "seoUrl": seoUrl,
    };
  }
}
