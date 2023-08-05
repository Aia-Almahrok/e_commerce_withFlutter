import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem('Dell Labtop', 60, 1, 'https://www.pngall.com/wp-content/uploads/2016/05/Laptop-PNG.png'),
    CartItem('Blouse', 20, 1,
        'https://m.media-amazon.com/images/I/412e6QcoUrL.jpg'),
    CartItem('Cooker', 300, 1, 'https://www.zanussi.com.eg/globalassets/appliances/product-images/zcg92696xa-1200x1200.jpg?preset=medium'),
    CartItem('Cleanser', 15, 1,
        'https://cdn.salla.sa/djovA/utj3ABb8ckZBzlYcDnfFEDgB0xE8HHgX3OnPhNDU.jpg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                cartItems[index].imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(cartItems[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${cartItems[index].price.toStringAsFixed(2)}'),
                  Text('Quantity: ${cartItems[index].quantity}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Order Placed'),
                      content: Text('Your order has been placed successfully.'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Place Order'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem(this.name, this.price, this.quantity, this.imageUrl);
}