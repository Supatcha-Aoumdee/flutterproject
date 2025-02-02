import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  // String name = "";
  final _formKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple'),
      ),
      body: 
      Form(
        key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _username,
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            // onChanged: (value) {
            //   setState(() {
            //     name = value;
            //     }
            //   );
            // },
          ),
          TextFormField(
            controller: _password, 
            obscureText: true, //เวลาใส่password แล้วขึ้นเป็นจุด
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) { 
                return "Password must be more than 8 characters";
              }
              return null;
            },
            // onChanged: (value) {
            //   setState(() {
            //     name = value;
            //     }
            //   );
            // },
          ),
          //แบบล่างนี้แนะนำเฉยๆ
          // TextFormField(
          //   // controller: _nameController,
          //   decoration: const InputDecoration(
          //     prefixIcon: Icon(Icons.person),
          //     hintText: 'Name',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(15)),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(width: 2.0),
          //     ),
          //   ),
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter your name';
          //     }
          //     return null;
          //   },
          //   onChanged: (value) {
          //     print(value);
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Username: ${_username.text}');
                print('Password: ${_password.text}');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
      )
      
    );
  }
}
