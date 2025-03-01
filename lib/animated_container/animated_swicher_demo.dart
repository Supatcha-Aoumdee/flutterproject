import 'package:flutter/material.dart';

class AnimatedSwicherDemo extends StatefulWidget {
  const AnimatedSwicherDemo({super.key});

  @override
  State<AnimatedSwicherDemo> createState() => _AnimatedSwicherDemoState();
}

class _AnimatedSwicherDemoState extends State<AnimatedSwicherDemo> {
  bool _isFirst = true;
  void _switchWidget() {
    setState(() {
      _isFirst = !_isFirst;
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
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _isFirst
                ? Container(
                    key: const ValueKey(1),
                    width: 100,
                    height: 100,
                    color: Colors.orange)
                : Container(
                    key: const ValueKey(2),
                    width: 100,
                    height: 100,
                    color: Colors.blue),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _switchWidget,
            child: const Text('Switch Widget'),
          ),
        ],
      )),
    );
  }
}
