import 'dart:convert';
import 'package:demoproject/rest_api/rest_api_product_from.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApiProductList extends StatefulWidget {
  const RestApiProductList({super.key});

  @override
  State<RestApiProductList> createState() => _RestApiProductListState();
}

class _RestApiProductListState extends State<RestApiProductList> {
  List<dynamic> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        showSnackbar('Unable to fetch data');
      }
    } catch (e) {
      showSnackbar('Connection error occurred');
    } finally {
      setState(() => isLoading = false);
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
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                var response = await http
                    .delete(Uri.parse('http://10.0.2.2:8001/products/$id'));
                if (response.statusCode == 200) {
                  fetchData();
                  showSnackbar('Product deleted successfully!', Colors.red);
                } else {
                  showSnackbar(
                      'Error occurred while deleting product', Colors.red);
                }
              } catch (e) {
                showSnackbar('Failed to delete product', Colors.red);
              }
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void showSnackbar(String message, [Color color = Colors.black]) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Product', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return ListTile(
                  leading: Text('${product['id']}'),
                  title: Text(product['name'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${product['description']}',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      SizedBox(height: 4),
                      Text(
                        '${product['price']}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RestApiProductFrom(product: product)),
                        ).then((_) => fetchData()),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RestApiProductFrom()),
        ).then((_) => fetchData()),
        child: Icon(Icons.add),
      ),
    );
  }
}
