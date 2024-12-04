import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cart.clearCart();
            },
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? Center(
        child: Text(
          'Your Cart is Empty!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items.values.toList()[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${item.quantity}')),
            title: Text(item.title),
            subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(item.id.hashCode);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blueGrey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                if (cart.itemCount > 0) {
                  // Call the demo payment function
                  await _processPayment(context, cart);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Your cart is empty!')),
                  );
                }
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _processPayment(BuildContext context, CartProvider cart) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Simulate payment processing delay
    await Future.delayed(Duration(seconds: 3));

    Navigator.pop(context); // Close the loading dialog

    // Mock payment success
    final isSuccess = true; // Change to false for testing failure

    if (isSuccess) {
      cart.clearCart();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment Successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment Failed. Try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
