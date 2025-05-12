import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import 'products.dart';

class Cart extends StatefulWidget {
  static List<Map<String, dynamic>> cartItems = [];

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Cart.cartItems.isEmpty
          ? Center(child: Text('No Items Added'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.cartItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue[300],
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Cart.cartItems[index]['image'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Cart.cartItems[index]['name'],
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(Cart.cartItems[index]['description']),
                                    Text(
                                      Cart.cartItems[index]['price'],
                                      style: TextStyle(fontSize: 16, color: Colors.red[800]),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Products().createState().products.add(Cart.cartItems[index]);
                                          Cart.cartItems.removeAt(index);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: Text('Remove from Cart'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Cart.cartItems.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Order Placed!')),
                      );
                    });
                  },
                  child: Text('Place Order'),
                ),
              ],
            ),
    );
  }
}
