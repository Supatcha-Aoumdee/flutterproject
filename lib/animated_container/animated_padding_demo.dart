import 'package:flutter/material.dart';

class AnimatePaddingDemo extends StatefulWidget {
  const AnimatePaddingDemo({super.key});

  @override
  State<AnimatePaddingDemo> createState() => _AnimatePaddingDemoState();
}

class _AnimatePaddingDemoState extends State<AnimatePaddingDemo> {
  double _padding = 10;
  void _increasePadding() {
    setState(() {
      _padding = _padding == 10 ? 50 : 10;
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
          AnimatedPadding(
            duration: const Duration(seconds: 1),
            padding: EdgeInsets.all(_padding),
            child: Container(width: 100, height: 100, color: Colors.green),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _increasePadding,
            child: const Text('Change Padding'),
          ),
        ],
      )),
    );
  }
}
