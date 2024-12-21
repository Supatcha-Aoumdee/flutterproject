import 'package:demoproject/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //ป้องกันว่าจะแสดงเป็น version debug อยู่
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(//Scaffold ใช้จัดโครงสร้างของ app
        appBar: AppBar(
          title: const Text( //Text widget
            'Flustter Demo', 
            style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        ), //Widget dynamic
        body: Container(//เป็นเสมือน box 
          height: 100,
          width: 100,
          //ถ้าปิด 3 อันล่างนี้จะมีการเตือนตรง container ให้ใช้ Sizedbox
          color: Colors.green,
          padding: const EdgeInsets.all(20),//กำหนดกรอบภายใน
          margin: const EdgeInsets.all(20),//กำหนดกรอบภายนอก
          child: const Text('Hello')
        ),//body เป็นตัวบอกว่าจะใส่อะไรไว้ในนี้

        floatingActionButton: FloatingActionButton(
          onPressed: () {//ปุ่มลอย ๆ บนหน้าจอ
          print("Hello");//debug
        },
        child: const Icon(Icons.phone),//เพิ่มรูปในปุ่ม
        ),
      ) //const MyHomePage(),
);
  }
}


