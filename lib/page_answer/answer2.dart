import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  _SocialMediaPostState createState() => _SocialMediaPostState();
}

class _SocialMediaPostState extends State<Answer2> {
  final String userName = 'Supatcha Aoumdee';
  final String postTime = '5 minutes ago';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Social Media Post'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(postTime),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            height: 200,
            color: Colors.indigo,
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Like'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Comment'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Share'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}