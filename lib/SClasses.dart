// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/login.dart';
// import 'package:flutter_timetable/subjects.dart';
// import 'package:focused_menu/focused_menu.dart';
// import 'package:focused_menu/modals.dart';

// class SelClass extends StatefulWidget {
//   const SelClass({super.key});

//   @override
//   State<SelClass> createState() => _SelClassState();
// }

// class _SelClassState extends State<SelClass> {
//   late String ADVISOR1 = 'Enter Name';
//   late String ADVISOR2 = 'Enter Name';
//   late String ADVISOR3 = 'Enter Name';
//   late String ADVISOR4 = 'Enter Name';

//   late String class1 = 'S3 CSE';
//   late String class2 = 'S4 CSE';
//   late String class3 = 'S5 CSE';
//   late String class4 = 'S6 CSE';


//   @override
//   Widget build(BuildContext context)  {
//     final _advisor = TextEditingController();
//     double Mwidth = MediaQuery.of(context).size.width*0.34;
//     double Mheight = MediaQuery.of(context).size.height*0.20;
//   // print('$Mheight $Mwidth');
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//           icon:Icon(Icons.logout),
//           onPressed: (){
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context)=>login())
//               , (route) => false);
//           },
//           )
//       ],centerTitle: true,title: Text('Select A Class'),),

//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
          
//             InkWell(
//               onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>subjects()));
//               },
//               child:Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 color: Colors.blue.withAlpha(55)
//                 ),
//                 // alignment: Alignment.center,
//                 width:Mwidth,
//                 height:Mheight,
//                 child: Column(children: [
//                   SizedBox(height: 5,),
//                    Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       SizedBox(height: 10,width: 10,),
//                       FocusedMenuHolder(
//                         openWithTap: true,
//                         menuWidth: Mwidth*1.5,                      child:Icon(Icons.more_vert),
//                       // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
//                         //  onPressed: (){

//                         //  },
//                           menuItems: [
//                             FocusedMenuItem(
//                               title: Text('Edit'),
//                               trailingIcon: Icon(Icons.edit),
                             
//                                onPressed: (){
//                                 showDialogField(1,Mheight*1.1,Mwidth);
                                
//                                }),

//                                FocusedMenuItem(
//                               title: Text('Open Class'),
//                               trailingIcon: Icon(Icons.open_in_new),
//                               // TextField(
//                               //   controller:_advisor ,

//                               // ),
//                                onPressed: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: ((context) => subjects())));
//                                })

//                             ],
//                             onPressed: (){},
//                             )
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   Text('$class1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   SizedBox(height: 10,),
//                   Text('ADVISOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
//                   SizedBox(height: 10,),
//                   Text('$ADVISOR1'),
//                 ]),
//               )
//             ),

//             InkWell(
//               onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>subjects()));
//               },
//               child:Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 color: Color.fromARGB(255, 33, 243, 93).withAlpha(55)
//                 ),
//                 // alignment: Alignment.center,
                
//                 width:Mwidth,
//                 height:Mheight,
//                 child: Column(children: [
//                   SizedBox(height: 5,),
//                    Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       SizedBox(height: 10,width: 10,),
//                       FocusedMenuHolder(
//                         openWithTap: true,
//                         menuWidth: Mwidth*1.5,                      child:Icon(Icons.more_vert),
//                       // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
//                         //  onPressed: (){

//                         //  },
//                           menuItems: [
//                             FocusedMenuItem(
//                               title: Text('Edit'),
//                               trailingIcon: Icon(Icons.edit),
                             
//                                onPressed: (){
//                                 showDialogField(2,Mheight*1.1,Mwidth);
                                
//                                }),

//                                FocusedMenuItem(
//                               title: Text('Open Class'),
//                               trailingIcon: Icon(Icons.open_in_new),
//                                onPressed: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: ((context) => subjects())));
//                                })

//                             ],
//                             onPressed: (){},
//                             )
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   Text('$class2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   SizedBox(height: 10,),
//                   Text('ADVISOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
//                   SizedBox(height: 10,),
//                   Text('$ADVISOR2'),
//                 ]),
//               )
//             ),
//           ],
//         ),
//          Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
          
//             InkWell(
//               onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>subjects()));
//               },
//               child:Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 color: Color.fromARGB(255, 243, 33, 33).withAlpha(65)
//                 ),
//                 // alignment: Alignment.center,
//                 width:Mwidth,
//                 height:Mheight,
//                 child: Column(children: [
//                     SizedBox(height: 5,),
//                    Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       SizedBox(height: 10,width: 10,),
//                       FocusedMenuHolder(
//                         openWithTap: true,
//                         menuWidth: Mwidth*1.5,                      child:Icon(Icons.more_vert),
//                           menuItems: [
//                             FocusedMenuItem(
//                               title: Text('Edit '),
//                               trailingIcon: Icon(Icons.edit),
                             
//                                onPressed: (){
//                                 showDialogField(3,Mheight*1.1,Mwidth);
                                
//                                }),

//                                FocusedMenuItem(
//                               title: Text('Open Class'),
//                               trailingIcon: Icon(Icons.open_in_new),
//                                onPressed: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: ((context) => subjects())));
//                                })

//                             ],
//                             onPressed: (){},
//                             )
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   Text('$class3',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   SizedBox(height: 10,),
//                   Text('ADVISOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
//                   SizedBox(height: 10,),
//                   Text('$ADVISOR3'),
//                 ]),
//               )
//             ),

//             InkWell(
//               onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>subjects()));
//               },
//               child:Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 color: Color.fromARGB(255, 229, 243, 33).withAlpha(65)
//                 ),
//                 // alignment: Alignment.center,
//                 width:Mwidth,
//                 height:Mheight,
//                 child: Column(children: [
//                   SizedBox(height: 5,),
//                    Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       SizedBox(height: 10,width: 10,),
//                       FocusedMenuHolder(
//                         openWithTap: true,
//                         menuWidth: Mwidth*1.5,                      child:Icon(Icons.more_vert),
                     
//                           menuItems: [
//                             FocusedMenuItem(
//                               title: Text('Edit '),
//                               trailingIcon: Icon(Icons.edit),
                             
//                                onPressed: (){
//                                 showDialogField(4,Mheight*1.1,Mwidth);
//                                }),

//                                FocusedMenuItem(
//                               title: Text('Open Class'),
//                               trailingIcon: Icon(Icons.open_in_new),
//                                onPressed: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: ((context) => subjects())));
//                                })

//                             ],
//                             onPressed: (){},
//                             )
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   Text('$class4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   SizedBox(height: 10,),
//                   Text('ADVISOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
//                   SizedBox(height: 10,),
//                   Text('$ADVISOR4'),
                  
//                 ]),
//               )
//             ),
//           ],
//         )

//       ]),
//     );
//   }

//   void showDialogField(int a,double h,double w){
//     final _class = TextEditingController();
//     final _advisors =TextEditingController();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('CLASS',textAlign: TextAlign.center,),
//           content:Container( 
//             height:h,
//           // ListView(
//             // shrinkWrap: true,
//             child: Column(children: [

//               TextFormField(
//                 controller: _class,
//                 decoration:const InputDecoration(label: Text('Class'),hintText: 'Enter Class Names'),
//               ),
//               TextFormField(
//                 controller: _advisors,
//                 decoration: const InputDecoration(label: Text('Advisors'),hintText: 'Enter Advisors Names'),
//               ),
//               SizedBox(height: h*0.0338,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [

//               TextButton(child: Text('close'),onPressed: (){Navigator.of(context).pop();},
//               ),
//               TextButton(onPressed: (){setState(() {

//                 if(_class.text != "" ){
//                   if(a==1) {
//                     class1 = _class.text.trim();
//                   } else if(a==2) {
//                     class2 = _class.text.trim();
//                   } else if(a==3) {
//                     class3 = _class.text.trim();
//                   } else {
//                     class4 = _class.text.trim();
//                   }

//                 }
//                 if(_advisors.text != "" ){
//                   if(a==1)
//                     ADVISOR1 = _advisors.text.trim();
//                   else if(a==2)
//                     ADVISOR2 = _advisors.text.trim();
//                   else if(a==3)
//                     ADVISOR3 = _advisors.text.trim();
//                   else
//                     ADVISOR4 = _advisors.text.trim();

//                 }
//                 // else
//                 // { 
//                   // if(a==1)
//                   //   ADVISOR1 = 'Enter Name';
//                   // else if(a==2)
//                   //   ADVISOR2 = 'Enter Name';
//                   // else if(a==3)
//                   //   ADVISOR3 = 'Enter Name';
//                   // else
//                   //   ADVISOR4 = 'Enter Name';
//                 // }

//                 Navigator.of(context).pop();
//               });}, child: Text('Ok'))
//               ]
//             )
//             ]),
//             // children: [
//             // ],
//           ),
//           // actions: [
//           // ],
//         );
//       },
//     );
//   }

// }