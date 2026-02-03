// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String category;
    String description;
    String thumbnail;
    int stock;
    int sold;
    bool isFeatured;
    String size;
    String seller;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.category,
        required this.description,
        required this.thumbnail,
        required this.stock,
        required this.sold,
        required this.isFeatured,
        required this.size,
        required this.seller,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        category: json["category"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        stock: json["stock"],
        sold: json["sold"],
        isFeatured: json["is_featured"],
        size: json["size"],
        seller: json["seller"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category": category,
        "description": description,
        "thumbnail": thumbnail,
        "stock": stock,
        "sold": sold,
        "is_featured": isFeatured,
        "size": size,
        "seller": seller,
    };
}
