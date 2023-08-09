import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_timetable/cTimeTab.dart';
import 'package:flutter_timetable/listClasses.dart';
import 'package:flutter_timetable/login.dart';
import 'package:flutter_timetable/shedules.dart';
import 'package:flutter_timetable/subjects.dart';

import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class BottomBar extends StatefulWidget {
   BottomBar({super.key,required this.ClassId,required this.id});
  late String ClassId;
  late int id;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
final _controller = PageController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          subjects(classId: widget.ClassId,id:widget.id),
          // ListClasses(),
          // login(),
          Shedules(ClassId: widget.ClassId,id:widget.id),
          CtimeTable(ClassId: widget.ClassId,id:widget.id)
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        color: Colors.grey,
        activeItemColor: Color.fromARGB(255, 255, 0, 0),
        itemColor: Colors.black,
        flat: true,
        useActiveColorByDefault: true,
        items: [
          RollingBottomBarItem(Icons.menu_book_sharp,label: 'Subjects',),//activeColor: Color.fromARGB(255, 255, 255, 255)),
          RollingBottomBarItem(Icons.laptop_mac,label: 'Shedule',),//activeColor: Color.fromARGB(255, 255, 255, 255)),
          RollingBottomBarItem(Icons.table_chart_outlined,label: 'Time Teble',activeColor: Color.fromARGB(255, 34, 255, 0)),
        ],
        enableIconRotation: true,
        onTap: ((value) {
          _controller.animateToPage(value,
           duration: const Duration(milliseconds: 400), 
           curve: Curves.easeOut
           );
        }),
        ),
    );
  }
}