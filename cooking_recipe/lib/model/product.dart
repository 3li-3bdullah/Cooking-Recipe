class Product {
  String? uri;
  String? label;
  String? image;
  String? source;
  Product({this.uri, this.label, this.image, this.source});

  Product.fromJson(Map<String, dynamic> json) {
    uri = json['recipe']['uri'];
    label = json['recipe']['label'];
    image = json['recipe']['image'];
    source = json['recipe']['source'];
  }
}

class Model {
  List<Product>? hits;
  Model({this.hits});
  Model.fromJson(Map<String, dynamic> json) {
    hits = (json["hits"] as List).map((e) => Product.fromJson(e)).toList();
  }
}
