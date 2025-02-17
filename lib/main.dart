// import 'package:demoproject/bottom_navigation_bar/bottom_navigation_bar.dart';
// import 'package:demoproject/page_navigation/first_page.dart';
// import 'package:demoproject/api_air_quality_index/air_quality_index.dart';
// import 'package:demoproject/api_test/simple_api_call.dart';
// import 'package:demoproject/firebase_test/fire_store_demo.dart';
import 'package:demoproject/rest_api/rest_api_product_list.dart';
import 'package:flutter/material.dart';
// import 'package:demoproject/page_answer/answer1.dart';
// import 'package:demoproject/page_answer/answer2.dart';
// import 'package:demoproject/page_answer/answer3.dart';
// import 'package:demoproject/page_answer/answer4.dart';
// import 'package:demoproject/form_widget/form_simple.dart';
// import 'package:demoproject/form_widget/registration_form.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: FireStoreDemo());
    return MaterialApp(home: RestApiProductList());
    // return MaterialApp(home: AirQualityIndex());
    // return MaterialApp(home: SimpleApiCall());
    // return MaterialApp(home: FormSimple());
    // return MaterialApp(home: RegistrationForm());
  }
}
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('My Answer'),
//         backgroundColor: Colors.amber,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Answer1()),
//                 );
//               },
//               child: const Text('Go to Answer 1'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Answer2()),
//                 );
//               },
//               child: const Text('Go to Answer 2'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Answer3()),
//                 );
//               },
//               child: const Text('Go to Answer 3'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Answer4()),
//                 );
//               },
//               child: const Text('Go to Answer 4'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
