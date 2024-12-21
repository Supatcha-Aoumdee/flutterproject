
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CPSU Project",
          style: TextStyle(
            color: Colors.white, fontSize: 28, letterSpacing: 4)),
        backgroundColor: Colors.redAccent,
        centerTitle: true),
      backgroundColor:  Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
      Container(

        padding: const EdgeInsets.all(15),
        color: Colors.blueAccent,
        child: const Text("hello Wolrd")),
        Container(

        padding: const EdgeInsets.all(15),
        color: Colors.blueAccent,
        child: const Text("hello Wolrd")),
        Container(

        padding: const EdgeInsets.all(15),
        color: Colors.blueAccent,
        child: const Text("hello Wolrd")),
      ])  
    );
  }
}
// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "CPSU Project",
//           style: TextStyle(color: Colors.white, fontSize: 28, letterSpacing: 4),
//         ),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly, // จัดวางให้ห่างเท่า ๆ กัน
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(10), // ขอบมน
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3), // เงาแนวนอนและแนวตั้ง
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 "Hello World",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 "Hello World",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 "Hello World",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
