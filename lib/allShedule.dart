import 'package:flutter/material.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/db/db_model.dart';

class allShed extends StatefulWidget {
    allShed({super.key ,required this.id,required this.ClassId});
    late int id;
      late String ClassId ;
  //  late ValueNotifier<List<Mttable>>? notifier ;
    // valueNotifiers1[ClassId]; 
  @override
  State<allShed> createState() => _allShedState();
}

class _allShedState extends State<allShed> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // allShedule(widget.id, '');
    setState(() {
      
    // widget.notifier=valueNotifiers1[widget.ClassId];
    // final notif =valueNotifiers1[widget.ClassId];
    print('sheeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    //  widget.notifier;

    allshedpage(widget.id);
    getttable(widget.id,widget.ClassId);
    });
  }
  // @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: tables('ie'),
//       ),
//     );
//    }
// }


  // class tables(ClassId) async{

   late String data1 ='';
  // late String ClassId;
final _List =[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
  @override
  Widget build(BuildContext context) {
  //  late ValueNotifier<List<Mttable>>? notifi=widget.notifier;
    print('hmmm');
    // final notif = widget.notifier;
    return Scaffold(
      body: SafeArea(
        child:Stack(
        children: [
          
          
         Padding(
          padding: const EdgeInsets.all(18.0),
          child:Center(
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
          SizedBox(height: 25,),
          Expanded(
            
            child: ValueListenableBuilder(
// isScrollControlled:true,
                valueListenable:myob.getValueNotfier(widget.ClassId), //notif!,
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
          ),
        ),
        Text('${widget.ClassId}')
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ElevatedButton.icon(
      //           onPressed: (){
           
      // {

      //    allShedule(widget.id!);
      // } 
          

      //           },
      //            icon: Icon(Icons.replay_outlined),
      //             label: Text('Shedule'),
      //             style:ButtonStyle( 
      //               shape:MaterialStateProperty.all(
      //                 RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //                 )
      //               )
      //             )
      //             ),
      //       ],
      //     ),

        ],
        // child:
      ), 
        ),
    );
  }
  }
// }