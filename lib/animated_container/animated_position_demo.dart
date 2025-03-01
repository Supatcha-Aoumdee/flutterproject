import 'package:flutter/material.dart';

class AnimatePositionDemo extends StatefulWidget {
  const AnimatePositionDemo({super.key});

  @override
  State<AnimatePositionDemo> createState() => _AnimatePositionDemoState();
}

class _AnimatePositionDemoState extends State<AnimatePositionDemo> {
  bool _isLeft = true;
  void _moveBox() {
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
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _isLeft ? 20 : 200,
            top: 100,
            child: Container(width: 100, height: 100, color: Colors.purple),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _moveBox,
              child: const Text('Move Box'),
            ),
          ),
        ],
      )),
    );
  }
}
