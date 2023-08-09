import 'package:flutter/material.dart';
import 'package:flutter_timetable/allShedule.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/db/db_model.dart';

class shedulepage extends StatefulWidget {
   shedulepage({super.key,required this.id});
  late int id;
  @override
  State<shedulepage> createState() => _shedulepageState();
}

class _shedulepageState extends State<shedulepage> {
  void initState(){
    super.initState();
    // allshedpage(widget.id).whenComplete((){

              // allShedule(widget.id,'');
    // });
   
              allshedpage( widget.id);

    
  }
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      body: SafeArea(
        child:ValueListenableBuilder(
          valueListenable: allsh,
          builder: (BuildContext context, List<Mall> allShedules, Widget? child) {
            return ListView.separated(
              itemBuilder:(context,index){
                final s = allShedules[index];
                // setState(() {
                  
                // getttable(widget.id,s.ClassId);
                // });

                print(s.ClassId);
                return Container(
                  height: 280,
                  child:allShed(id: widget.id, ClassId: s.ClassId)
                  // Container(
                  //   child:Text('${s.ClassId}    ${widget.id}')
                  // )
                );
              },
              itemCount: allShedules.length,//(allShedules.length/2).floor(),
              separatorBuilder: ((context, index) {
                return Divider(thickness: 15,);
              }),
            );
          },),
         ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Shedule time Table',
        elevation: 2,
        child: 
            Icon(Icons.replay_circle_filled_outlined),
            onPressed: (){
              
                // allShedule(widget.id,'Delete').whenComplete((){
                  // setState(() {
                    getClasses(widget.id, '').then((value){
                      value.forEach((map){
                        final ob=Mclasses.fromMap(map);

                      delAllShedule(widget.id,ob.ClassId).whenComplete(() {
                      });

                    });
                    
                });
              allShedule(widget.id,'');//.whenComplete((){
              // allshedpage( widget.id);
                  // });

              // });

              //  .whenComplete(){

              //  };
          }),
    );
  }
}