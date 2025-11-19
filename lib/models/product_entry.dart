// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
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
    int idUser;

    ProductEntry({
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
        required this.idUser,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
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
        idUser: json["id_user"],
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
        "id_user": idUser,
    };
}
