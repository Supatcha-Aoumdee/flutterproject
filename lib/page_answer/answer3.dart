import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Display'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Category: Electronics',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                image: 'assets/Product1.jpg',
                name: 'Laptop',
                price: '999 THB',
              ),
              ProductItem(
                image: 'assets/Product2.jpg',
                name: 'Smartphone',
                price: '699 THB',
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                image: 'assets/Product3.jpg',
                name: 'Tablet',
                price: '499 THB',
              ),
              ProductItem(
                image: 'assets/Product4.jpg',
                name: 'Camera',
                price: '299 THB',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductItem({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(price, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ],
    );
  }
} 