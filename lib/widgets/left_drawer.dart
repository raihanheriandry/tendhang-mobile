import 'package:flutter/material.dart';
import 'package:tendhang_mobile/screens/add_product.dart';
import 'package:tendhang_mobile/screens/menu.dart';
import 'package:tendhang_mobile/screens/product_entry_list.dart';
import 'package:tendhang_mobile/screens/my_product_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Text(
                  'Tendhang\nFootball Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Where Kickers Find Their Gear", style: TextStyle()),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Add Product'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.storefront_outlined),
            title: const Text('All Product List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.inventory_2_outlined),
            title: const Text('My Product List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProductEntryListPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
