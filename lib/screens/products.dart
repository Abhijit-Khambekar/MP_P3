import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import 'cart.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Camera',
      'description': 'Capture Every Moment.',
      'price': '\$100',
      'image': 'assets/images/p2.jpg',
    },
    {
      'name': 'Nivia',
      'description': 'Only for Men',
      'price': '\$50',
      'image': 'assets/images/p1.jpg',
    },
    {
      'name': 'Watch',
      'description': 'It Tells Time!!',
      'price': '\$80',
      'image': 'assets/images/p3.jpg',
    },
    {
      'name': 'Dove',
      'description': 'Lets be Beautiful',
      'price': '\$20',
      'image': 'assets/images/p4.jpg',
    },
    {
      'name': 'Cocacola',
      'description': 'Better Choice than Kala-Khatta',
      'price': '\$5',
      'image': 'assets/images/p5.jpg',
    }
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: products.isEmpty
          ? Center(child: Text('No Items Available'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue[300],
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          products[index]['image'],
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
                                products[index]['name'],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(products[index]['description']),
                              Text(
                                products[index]['price'],
                                style: TextStyle(fontSize: 16, color: Colors.green[800]),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Cart.cartItems.add(products[index]);
                                    products.removeAt(index);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Text('Add to Cart'),
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
    );
  }
}
