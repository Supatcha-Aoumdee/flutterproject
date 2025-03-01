import 'package:flutter/material.dart';

class AnimatedStackDemo extends StatefulWidget {
  const AnimatedStackDemo({super.key});

  @override
  State<AnimatedStackDemo> createState() => _AnimatedStackDemoState();
}

class _AnimatedStackDemoState extends State<AnimatedStackDemo> {
  bool _isLeft = true;
  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
          child: Stack(
        children: [
          // Positioned(
          //     bottom: 10,
          //     left: 10,
          //     child: Container(width: 100, height: 100, color: Colors.red)),
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: _isLeft ? Alignment.topLeft : Alignment.bottomRight,
            child: Container(width: 100, height: 100, color: Colors.red),
          ),
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: _isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(width: 100, height: 50, color: Colors.green),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _togglePosition,
              child: const Text('Move Box'),
            ),
          ),
        ],
      )),
    );
  }
}
