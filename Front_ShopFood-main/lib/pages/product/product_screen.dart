import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/api/api_product.dart';
import 'package:store_app/controller/product_controller.dart';

import '../../models/product.dart';
import '../../widget/text_custom.dart';
import '../food_card.dart/Food_Card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    final list = await ApiProduct.getProducts();
    setState(() {
      products = list;
      print(list[0].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: products.isEmpty ? 0 : (products.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final firstFoodIndex = index * 2;
                  final secondFoodIndex = index * 2 + 1;
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: FoodCard(product: products[firstFoodIndex]),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: FoodCard(product: products[secondFoodIndex]),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
