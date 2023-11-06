import 'package:flutter/material.dart';
import 'package:store_app/models/carts.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Carts carts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: carts.carts == null ? 0 : carts.carts.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product ID : ${carts.carts[index].id}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Date order : ${carts.carts[index].date}",
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            const Icon(
                              Icons.remove_red_eye,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
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
