import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double _size = 100;
  Color _color = Colors.blue;
  void _changeBox() {
    setState(() {
      _size = _size == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1), // ระยะเวลาของ Animation
            curve: Curves.easeInOut, // รูปแบบการเคลื8อนไหว
            width: _size, //เปลี8ยนขนาดความกว้าง
            height: _size, //เปลี8ยนขนาดสูง
            color: _color, //เปลี8ยนสี
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeBox,
            child: const Text('Animate Box'),
          ),
        ],
      )),
    );
  }
}
