// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/login.dart';
// import 'package:flutter_timetable/subjects.dart';
// import 'package:spincircle_bottom_bar/modals.dart';
// import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

// class BottomBarCircleAn extends StatefulWidget {
//   const BottomBarCircleAn({super.key});

//   @override
//   State<BottomBarCircleAn> createState() => BottomBarCircleAnState();
// }

// class BottomBarCircleAnState extends State<BottomBarCircleAn> {
//   var widg = subjects(classId: 'CMS');
//   // var widge = login();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SpinCircleBottomBarHolder(
//         bottomNavigationBar: SCBottomBarDetails(
//           circleColors: [Colors.brown,Colors.orange,Colors.redAccent],
//           iconTheme: IconThemeData(color: Colors.black45),
//           elevation: 2,
//           items: [
//             SCBottomBarItem(icon: Icons.menu_book, onPressed: (){}),
//             SCBottomBarItem(icon: Icons.home, onPressed:()=>loginPage() ),
//             SCBottomBarItem(icon: Icons.home, onPressed:()=>loginPage() ),
//             SCBottomBarItem(icon: Icons.menu_book, onPressed: (){
//               setState(() {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginPage()));
//               });
//             }),
//           ],
//            circleItems: [
//             SCItem(icon:Icon(Icons.add_to_drive), onPressed: (){}),
//             SCItem(icon:Icon(Icons.duo_sharp), onPressed: (){})
//            ],
//            bnbHeight: 80,
//            ),
//          child: widg
//         //  subjects(classId: 'S6 CSE')
//         ),
//     );
//   }
// }