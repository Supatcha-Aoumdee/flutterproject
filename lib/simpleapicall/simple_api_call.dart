import 'dart:convert';
import 'package:demoproject/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleApiCall extends StatefulWidget {
  const SimpleApiCall({super.key});

  @override
  State<SimpleApiCall> createState() => _SimpleApiCallState();
}

class _SimpleApiCallState extends State<SimpleApiCall> {
  List<UserData> users = [];
  bool isLoading = true; 

  Future<void> fetchData() async {
    setState(() {
      isLoading = false;
    });

    try {
      await Future.delayed(Duration(seconds: 2));
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(
            response.body); //แปลง response แบบ json เป็น list dynamic

        setState(() {
          users = jsonList
              .map((item) => UserData.fromJson(item))
              .toList(); //ก้อน list ของตัว user
          isLoading = true;    
        });
        //ลองloop หรือไม่ก็ได้
        // for (var user in users) {
        //   print("ID: ${user.id}, Name: ${user.name}, Email: ${user.email}");
        // }
      } else {
        print("Invalid Data");
        setState(() {
          isLoading = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple API Call'), centerTitle: true),
      body: isLoading
      ?ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: users.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Text('${users[index].id}'),
            title:  Text('${users[index].name}'),
            subtitle: Text('${users[index].email}'),
            trailing: Text('(${users[index].username})'),
          );
        },
      )
      : const Center(child: CircularProgressIndicator())
      //(child: Text('loading')),
    );
  }
}
