import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:tendhang_mobile/models/product_entry.dart';
import 'package:tendhang_mobile/screens/product_detail.dart';
import 'package:tendhang_mobile/widgets/left_drawer.dart';
import 'package:tendhang_mobile/widgets/product_entry_card.dart';

class MyProductEntryListPage extends StatefulWidget {
  const MyProductEntryListPage({super.key});

  @override
  State<MyProductEntryListPage> createState() => _MyProductEntryListPageState();
}

class _MyProductEntryListPageState extends State<MyProductEntryListPage> {
  Future<List<Product>> fetchNews(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/json-my/');

    // Decode response to json format
    var data = response;

    // Convert json data to NewsEntry objects
    List<Product> listNews = [];
    for (var d in data) {
      if (d != null) {
        listNews.add(Product.fromJson(d));
      }
    }
    return listNews;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('My Product List'), backgroundColor: Theme.of(context).colorScheme.primary,),
      drawer: const LeftDrawer(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: FutureBuilder(
        future: fetchNews(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product yet.',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to news detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
