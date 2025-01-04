// MyStatefulWidget
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print("Init!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefulWidget"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter Value:", style: const TextStyle(fontSize: 22, color: Color.fromARGB(255, 0, 0, 0))),
            // const SizedBox(height: 5),
            Text("$counter", style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold,)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text("+ Increment"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (counter > 0) {  
                    counter--;
                    }
                  });
                },
                child: const Text("- Decrement"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: const Text("Reset"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
