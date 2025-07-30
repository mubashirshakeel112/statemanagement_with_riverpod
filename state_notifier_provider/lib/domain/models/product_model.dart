class ProductModel{
  String name;
  double price;
  int quantity;
  bool favourite;

  ProductModel({required this.name, required this.price, required this.quantity, required this.favourite});

  ProductModel copyWith({String? name, double? price, int? quantity, bool? favourite}){
    return ProductModel(name: name ?? this.name, price: price ?? this.price, quantity: quantity ?? this.quantity, favourite: favourite ?? this.favourite);
  }
}