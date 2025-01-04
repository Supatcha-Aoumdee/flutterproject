import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String massage;
  const SecondPage({super.key, required this.massage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Second Page ($massage)'),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('< Go Back'),
        ),
      ),
    );
  }
}
