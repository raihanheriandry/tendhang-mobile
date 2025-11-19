import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendhang_mobile/widgets/left_drawer.dart';
import 'package:tendhang_mobile/models/product_entry.dart';
import 'package:tendhang_mobile/widgets/product_entry_card.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:tendhang_mobile/screens/product_detail.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({super.key});

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get("http://localhost:8000/json/");

    final currentUserId = request.jsonData['id']; 
    List<ProductEntry> all = [];
    for (var item in response) {
      if (item != null) {
        all.add(ProductEntry.fromJson(item));
      }
    }

    List<ProductEntry> myProducts =
        all.where((p) => p.idUser == currentUserId).toList();

    return myProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading your products."));
          }

          if (!snapshot.hasData || snapshot.data.length == 0) {
            return const Center(
              child: Text(
                "You haven't added any products yet.",
                style: TextStyle(fontSize: 18, color: Color(0xff59A5D8)),
              ),
            );
          }

          List<ProductEntry> products = snapshot.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];
              return ProductEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
