// import 'package:demoproject/bottom_navigation_bar/bottom_navigation_bar.dart';
// import 'package:demoproject/page_navigation/first_page.dart';
// import 'package:demoproject/api_air_quality_index/air_quality_index.dart';
// import 'package:demoproject/api_test/simple_api_call.dart';
// import 'package:demoproject/firebase_test/fire_store_demo.dart';
// import 'package:demoproject/component/custom_card.dart';
import 'package:demoproject/animated_container/animated_padding_demo.dart';
import 'package:demoproject/animated_container/animated_position_demo.dart';
import 'package:demoproject/animated_container/animated_stack_demo.dart';
import 'package:demoproject/animated_container/animated_swicher_demo.dart';
import 'package:demoproject/animated_container/animated_traffic.dart';
import 'package:demoproject/component/custom_counter.dart';
import 'package:demoproject/component/profile_card.dart';
// import 'package:demoproject/rest_api/rest_api_product_list.dart';
import 'package:flutter/material.dart';
// import 'package:demoproject/page_answer/answer1.dart';
// import 'package:demoproject/page_answer/answer2.dart';
// import 'package:demoproject/page_answer/answer3.dart';
// import 'package:demoproject/page_answer/answer4.dart';
// import 'package:demoproject/form_widget/form_simple.dart';
// import 'package:demoproject/form_widget/registration_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demoproject/animated_container/animated.dart';
import 'package:demoproject/animated_container/animated_opacity_demo.dart';
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
    return MaterialApp(home: AnimatedTraffic());
    // return MaterialApp(home: AnimatedSwicherDemo());
    // return MaterialApp(home: AnimatePositionDemo());
    // return MaterialApp(home: AnimatePaddingDemo());
    // return MaterialApp(home: AnimatedStackDemo());
    // return MaterialApp(home: AnimatedOpacityDemo());
    // return MaterialApp(home: Animated());
    // return MaterialApp(home: RestApiProductList());
    // return MaterialApp(home: AirQualityIndex());
    // return MaterialApp(home: SimpleApiCall());
    // return MaterialApp(home: FormSimple());
    // return MaterialApp(home: RegistrationForm());
  }
}

// class MyWidget extends StatelessWidget {
//   final VoidCallback onThemeToggle;
//   final ThemeMode themeMode;

//   const MyWidget({super.key, required this.onThemeToggle, required this.themeMode});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: RestApiProductList());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile Widget'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               themeMode == ThemeMode.dark ? Icons.wb_sunny : Icons.nightlight_round,
//             ),
//             onPressed: onThemeToggle, 
//           ),
//         ],
//       ),
//       body: const Center(
//         child: ProfileCard(
//           name: 'Supatcha Aoumdee',
//           position: 'Student',
//           email: 'Aoumdee_s@Silpakorn.edu',
//           phoneNumber: '0971279799',
//           imageUrl: 'assets/profile.jpg',
//           isAsset: true,
//         ),
//       ),
//     );
//   }
// }
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Custom Widget'),
//       centerTitle: true,backgroundColor: Colors.blue[100],),
//       body: const Center(
//         child: ProfileCard(
//           name: 'Supatcha Aoumdee',
//           position: 'Student',
//           email: 'Aoumdee_s@Silpakorn.edu',
//           phoneNumber: '0971279799',
//           imageUrl: 'assets/profile.jpg',
//           isAsset: true,
//         ),
//       ),
//     );
//   }
// }
// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   Color winPlayerColor = Colors.white;
//   void setWinPlayer(Color winColor) {
//     setState(() {
//       winPlayerColor = winColor;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: winPlayerColor,
//       appBar: AppBar(title: const Text('Custom Widget')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomCounterWidget(
//               title: 'TEAM A',
//               backgroundColor: Colors.red,
//               onPlayerwin: setWinPlayer, 
//             ),
//             const SizedBox(height: 10),
//             CustomCounterWidget(
//               title: 'TEAM B',
//               backgroundColor: Colors.blue,
//               onPlayerwin: setWinPlayer, 
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//*********************************************************** */
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
