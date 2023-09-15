class Product {
  String? name;
  String? image;
  String? description;
  int? price;
  Product({this.name, this.image, this.description, this.price});
  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
  }
}
