import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../widget/text_custom.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          showDialogFood(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  TextCustom(
                    text: widget.product.name,
                    textAlign: TextAlign.center,
                    size: 16,
                  ),
                  Image.network(
                    widget.product.image,
                    fit: BoxFit.cover,
                    width: 130,
                    height: 130,
                  ),
                  TextCustom(
                    text: widget.product.price.toString(),
                    textAlign: TextAlign.start,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogFood(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Product Name: ${widget.product.name}'),
              Image.network(
                widget.product.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text('Price: ${widget.product.price.toString()}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      // Decrease the quantity
                      setState(() {
                        if (amount > 0) {
                          amount--;
                        }
                      });
                    },
                  ),
                  Text(amount.toString()), // Display the quantity
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Increase the quantity
                      setState(() {
                        amount++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('ยืนยัน'),
            ),
          ],
        );
      },
    );
  }
}
