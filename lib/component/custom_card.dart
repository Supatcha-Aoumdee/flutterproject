import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isCircle;

  const CustomCard({
    super.key, 
    required this.text,
    required this.backgroundColor,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: 
          isCircle ? BorderRadius.circular(30) : BorderRadius.circular(0),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
