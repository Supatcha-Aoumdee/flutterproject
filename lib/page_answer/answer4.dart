import 'package:flutter/material.dart';

class Answer4 extends StatefulWidget {
  const Answer4({super.key});

  @override
  State<Answer4> createState() => _Answer4State();
}

class _Answer4State extends State<Answer4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile Page'),
        backgroundColor: Colors.orange,
      ),
      body: 
        Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Information Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('user@example.com', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('123 456 7890', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('123 Main Street', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
              child: const Text('Edit Profile'),
            ),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
