import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApiProductFrom extends StatefulWidget {
  final dynamic? product;
  const RestApiProductFrom({super.key, this.product});

  @override
  State<RestApiProductFrom> createState() => _RestApiProductFromState();
}

class _RestApiProductFromState extends State<RestApiProductFrom> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      nameController.text = widget.product['name'];
      descController.text = widget.product['description'];
      priceController.text = widget.product['price'].toString();
    }
  }

  Future<void> saveProduct() async {
    var url = widget.product == null
        ? 'http://10.0.2.2:8001/products'
        : 'http://10.0.2.2:8001/products/${widget.product['id']}';

    var response = await (widget.product == null
        ? http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": nameController.text,
              "description": descController.text,
              "price": double.tryParse(priceController.text) ?? 0.0,
            }))
        : http.put(Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": nameController.text,
              "description": descController.text,
              "price": double.tryParse(priceController.text) ?? 0.0,
            })));

    if (response.statusCode == 201 || response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาด!'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> deleteProduct(int id) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                var response = await http
                    .delete(Uri.parse('http://10.0.2.2:8001/products/$id'));
                if (response.statusCode == 200) {
                  Navigator.pop(context, true);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Error occurred while deleting product'),
                        backgroundColor: Colors.red),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Failed to delete product'),
                      backgroundColor: Colors.red),
                );
              }
            },
            child: Text('OK', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product == null ? 'Add Product' : 'Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name')),
            TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description')),
            TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.product != null) ...[
                  ElevatedButton(
                    onPressed: () => deleteProduct(widget.product!['id']),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child:
                        Text('Delete', style: TextStyle(color: Colors.white)),
                  ),
                ],
                ElevatedButton(
                  onPressed: saveProduct,
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
