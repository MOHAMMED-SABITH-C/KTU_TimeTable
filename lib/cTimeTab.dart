import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/db/db_classD.dart';
// import 'package:flutter_timetable/db/db_hiveFunc.dart';
// import 'package:flutter_timetable/db/db_hiveModel.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:flutter_timetable/db/db_classD.dart';
// import 'package:flutter_timetable/db/db_model.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CtimeTable extends StatefulWidget {
   CtimeTable({super.key,required this.ClassId,required this.id});
    late String ClassId;
    late int id;
  @override
  State<CtimeTable> createState() => _CtimeTableState();
}

class _CtimeTableState extends State<CtimeTable> {
  final ScreenshotController screenshotController=ScreenshotController();
  late String data1 ='';
  Uint8List? screenshot;
  // late String date ='';
final _List =[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getttable(widget.id,widget.ClassId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () async{
          screenshot=await screenshotController.capture() ;
          if(screenshot!=null){
            // final  dir = (await getTemporaryDirectory()).path;
            final  dir = (await getApplicationDocumentsDirectory()).path;
            final path = await '$dir/imshot.png';
            print(path);
            final File file = File(path);
            file.writeAsBytes(screenshot!);
            // await GallerySaver.saveImage(screenshot! );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Screenshot saved to gallery'))
            );
          }
        }
        , icon: Icon(Icons.download))],
      title: Text(widget.ClassId),centerTitle: true,),
      body: SafeArea(
        child:Stack(
        children: [
          
          
         Padding(
          padding: const EdgeInsets.all(18.0),
          child:Center(
            child:Screenshot(
              controller:screenshotController,
        child: Column(
        children: [
          SizedBox(height: 40,),
          Table(
            border: TableBorder(verticalInside: BorderSide(width: 1),bottom: BorderSide(width: 1),left: BorderSide(width: 1),top: BorderSide(width: 1),right: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(3.2),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2),
              5: FlexColumnWidth(2),
              6: FlexColumnWidth(2),
              7: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(children: [Text('Day',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('1',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('2',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('3',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('4',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('5',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('6',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('7',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    // Column(children: [Text('TENURE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                  ]),
            ],
          ),
          SizedBox(height: 25,child:Text(widget.ClassId,style: TextStyle(fontSize: 23,color: Colors.red,fontWeight:FontWeight.bold),)),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: ttable,
              // valueListenable: shedule,

              builder: (BuildContext context, List<Mttable> shedules,
                  Widget? child) {
                // return ListView.separated(
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final data = shedules[index];
                      // date = data.days;
                    return Table(
                      // border: TableBorder(
                      //     //top: BorderSide(width: 1,),
                      //     bottom: BorderSide(width: 1)),
            border: TableBorder(verticalInside: BorderSide(width: 1),bottom: BorderSide(width: 1),left: BorderSide(width: 1),top: BorderSide(width: 1),right: BorderSide(width: 1)),

                      columnWidths: {
                        0: FlexColumnWidth(3.2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(2),
                        4: FlexColumnWidth(2),
                        5: FlexColumnWidth(2),
                        6: FlexColumnWidth(2),
                        7: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(children: [Text('' + _List[data.days])],),
                              // Column(children: [Text(data.clas)],),
                              // Column(children: [Text((data.period).toString())],),
                              // data.period == 1 ?
                               Column(children: [Text(data.period1)],),//:
                              // data.period == 2 ?
                               Column(children: [Text(data.period2)],),//:
                              // data.period == 3 ?
                                Column(children: [Text(data.period3)],),//:
                              // data.period == 4 ? 
                               Column(children: [Text(data.period4)],),//:
                              // data.period == 5 ? 
                              Column(children: [Text(data.period5)],),//:
                              // data.period == 6 ?
                                Column(children: [Text(data.period6)],),
                              Column(children: [Text(data.period7)],),
                            ]),
                      ],
                    );
                  },
                  // separatorBuilder: (context, index) {
                  //           setState(){
                  //             data1 = date;
                  //           }
                  //   return const Divider();
                  // },
                  itemCount: shedules.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
        ),
            )
          ),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: (){
           
      {
    delAllShedule(widget.id,widget.ClassId).whenComplete(() {

        //  deleteall(widget.id).whenComplete((){
         shedul(widget.ClassId,widget.id);//.whenComplete(() {
          // getttable(widget.id, widget.ClassId);
          
         });
      //  } );
      } 
          

                },
                 icon: Icon(Icons.replay_outlined),
                  label: Text('Shedule'),
                  style:ButtonStyle( 
                    shape:MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    )
                  )
                  ),
            ],
          ),

        ],
        // child:
      ), 
        ),
    );
  }
}