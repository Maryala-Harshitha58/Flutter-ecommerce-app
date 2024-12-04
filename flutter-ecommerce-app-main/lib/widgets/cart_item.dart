import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CartItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('$quantity'),
      ),
      title: Text(title),
      subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Implement remove item functionality
        },
      ),
    );
  }
}
