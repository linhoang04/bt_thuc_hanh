
class Order {
  int orderId;
  User user;
  List<Product> product;

  Order({required this.orderId, required this.user, required this.product});

  factory Order.fromJson(map){
    return Order(
      orderId: map['id'],
      user: User.fromJson(map['user']),
      product: Product.parseData(map),
    );
  }
}

class User {
  String fullName;
  String email;
  User({required this.fullName, required this.email});

  factory User.fromJson(map){
    return User(
      fullName: map["fullName"],
      email: map["email"],
    );
  }
}
/* "id": 1,
      "name": "Product A",
      "price": 10.99,
      "categories": ["Electronics", "Gadgets"],
      "details": {
        "description": "This is Product A",
        "rating": 4.5
      }*/
class Product {
  int id;
  String name;
  int price;
  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(map){
    return Product(
      id: map["id"],
      name: map["name"],
      price: map["price"],
    );
  }

  static List<Product> parseData(map){
    var list = map["product"] as List;
    return list.map((product) => Product.fromJson(product)).toList();
  }
}