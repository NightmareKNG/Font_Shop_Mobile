import 'package:flutter/material.dart';

import '../cart/cart_scren.dart';
import '../product/product_screen.dart';
import '../profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  final List<Widget> tabViews = [
    const ProductScreen(),
    const CartScreen(),
    ProfileScreen(),
  ];

final List<String> tabTexts = [
    "สินค้า",
    "ตะกร้าสินค้า",
    "บัญชีของฉัน",
  ];
  final List<String> titleTexts = [
    "สินค้าทั้งหมด",
    "ตะกร้าสินค้า",
    "บัญชีของฉัน",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dremskeat'),
        actions: [
          if (titleTexts[selectedIndex] == "บัญชีของฉัน") ...[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ]
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: tabViews,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: tabTexts[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.content_paste),
            label: tabTexts[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: tabTexts[2],
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
