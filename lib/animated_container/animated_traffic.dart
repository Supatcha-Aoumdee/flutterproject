import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTraffic extends StatefulWidget {
  const AnimatedTraffic({super.key});

  @override
  State<AnimatedTraffic> createState() => _AnimatedTrafficState();
}

class _AnimatedTrafficState extends State<AnimatedTraffic> {
  int _currentLight = 0;
  int _timer = 60;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
        } else {
          _changeLight();
        }
      });
    });
  }

  void _changeLight() {
    setState(() {
      if (_currentLight == 0) {
        _currentLight = 1;
        _timer = 5;
      } else if (_currentLight == 1) {
        _currentLight = 2;
        _timer = 20;
      } else {
        _currentLight = 0;
        _timer = 60;
      }
    });
  }

  double _getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  Color _getTextColor() {
    if (_currentLight == 0) return Colors.red;
    if (_currentLight == 1) return Colors.yellow;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Traffic Light Animation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, 
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$_timer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: _getTextColor(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _getOpacity(0),
              duration: const Duration(milliseconds: 500),
              child: trafficLightCircle(Colors.red, _getOpacity(0)),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _getOpacity(1),
              duration: const Duration(milliseconds: 500),
              child: trafficLightCircle(Colors.yellow, _getOpacity(1)),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _getOpacity(2),
              duration: const Duration(milliseconds: 500),
              child: trafficLightCircle(Colors.green, _getOpacity(2)),
            ),
          ],
        ),
      ),
    );
  }

  Widget trafficLightCircle(Color color, double opacity) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: opacity == 1.0
            ? [
                BoxShadow(
                  color: color.withOpacity(0.6),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ]
            : [],
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}
