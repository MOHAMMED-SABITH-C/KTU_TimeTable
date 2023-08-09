import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/db/db_hiveFunc.dart';
// import 'package:flutter_timetable/db/db_hiveModel.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class Shedules extends StatefulWidget {
   Shedules({super.key,required this.ClassId,required this.id});
  late String ClassId;
  late int id;
  @override
  State<Shedules> createState() => _ShedulesState();
}


class _ShedulesState extends State<Shedules> {

void initState() {
    // TODO: implement initState
    super.initState();
    // getttable(widget.id,widget.ClassId);
    // setState(() {
      
    getShedule(widget.ClassId,widget.id,'');
    // });

  }
  final _list =[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday'
];
final numList = [0,1,2,3,4];
  @override
  Widget build(BuildContext context) {
    // late String subId='';
    // getShedule(widget.ClassId);
    
   double mwidth = MediaQuery.of(context).size.width;
   double mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(actions: [


      ],title: Text('${widget.ClassId}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),centerTitle: true,),
      body: Stack(
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
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(3),
                        3: FlexColumnWidth(2),

              4: FlexColumnWidth(1),
              // 4: FlexColumnWidth(2.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(children: [Text('Day',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    // Column(children: [Text('Class',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('Period',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('Subject',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('SubID',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('Edit',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                  ]),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: shedule,
              builder: (BuildContext context, List<Mshedule> shedules,
                  Widget? child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final data = shedules[index];
                    return Table(
            border: TableBorder(
              verticalInside: BorderSide(width: 1,strokeAlign: BorderSide.strokeAlignOutside),bottom: BorderSide(width: 1),left: BorderSide(width: 1),top: BorderSide(width: 1),right: BorderSide(width: 1)
              
              ),

                     
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(2),

                        4: FlexColumnWidth(1),
                        // 4: FlexColumnWidth(2.5),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(children: [Text('' + _list[data.days])],),
                              // Column(children: [Text(data.clas)],),
                              Column(children: [Text((data.period).toString())],),
                              Column(children: [Text(data.subj)],),
                              Column(children: [Text(data.subjId)],),
                              Column(children: [FocusedMenuHolder(
                                    menuWidth: mwidth*0.4,
                                    openWithTap: true,
                                    onPressed: (){
        
                                    },
                                    child: Icon(Icons.edit_note_outlined,color: Colors.black,),
                                    menuItems: [
                                        FocusedMenuItem(title: Text('Edit'),
                                         onPressed: (){
                                          showEditField(data.id,data.clas,data.period,data.days,data.subjId, mheight, mwidth);
                                         },
                                         trailingIcon: Icon(Icons.edit)
                                         ),
                                        FocusedMenuItem(backgroundColor: Colors.red,
                                        title: Text('Delete',style: TextStyle(color: Colors.white),),
                                         onPressed: (){
                                        deleShedule(data.id,data.clas,data.days, data.period);
                                        } ,
                                        trailingIcon:Icon(Icons.delete,color: Colors.white,) ,),
                                    ],
                                    )],),
                            ])
                      ],
                    );
                  },
                  // separatorBuilder: (context, index) {
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
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: 'add any subjucts',
                    child: ElevatedButton.icon(
                      onPressed: (){
                                showBottomSheet(context, mwidth,widget.ClassId,'');
                                // Mshedule(days:  , clas: clas, period: period, subj: subj, subjId: subjId)
                                // searchShedule();
                  
                      },
                       icon: Icon(Icons.add),
                       
                      //  onLongPress: () {
                         
                      //  },
                        label: Text('   Add     '),
                        style:ButtonStyle( 
                          backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent[700]),
                          shape:MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          )
                        )
                        ),
                  ),
                  Tooltip(
                    message: 'Add any common subject \n like lab/honor/minor',
                    child: ElevatedButton.icon(
                      onPressed: (){
                                showBottomSheet(context, mwidth,widget.ClassId,"add");
                                // Mshedule(days:  , clas: clas, period: period, subj: subj, subjId: subjId)
                                // searchShedule();
                  
                      },
                       icon: Icon(Icons.add),
                        label: Text('LAB/H/M '),
                        style:ButtonStyle( 
                          shape:MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          )
                        )
                        ),
                  ),
                      ElevatedButton.icon(
                        
                    onPressed: (){
                      delAllShedule(widget.id, widget.ClassId).whenComplete((){
                        // setState(() {
                          
                    // getShedule(widget.ClassId,widget.id,'');
    // getttable(widget.id,widget.ClassId);
                        // });

                      });


                    },
                     icon: Icon(Icons.delete),
                      label: Text('Delete all'),
                      style:ButtonStyle( 
                        backgroundColor: MaterialStateProperty.all(Colors.red),
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
          ),

        ],
        // child:
      ),
        //     floatingActionButton:
        // FloatingActionButton.extended(onPressed: () {
        //   showBottomSheet(context, mwidth,widget.ClassId);
        // },
        // label: Text(' Add '),
        // icon: Icon(Icons.add),
        // tooltip: 'add subjects',
        // ),
        // floatingActionButtonLocation:FloatingActionButtonLocation.endFloat
    );
  }
Future <void> showBottomSheet(BuildContext context,double mwidth,String classid,String type) async{
  final _subId = TextEditingController();
  final _teacherId = TextEditingController();
  final _subName = TextEditingController();
  final _teacherName = TextEditingController();
  final _period = TextEditingController();
  // final _day = TextEditingController();
  late String times;
     late String subid;// = 'Subject name';
     late String teacherid;// = 'Subject name';
  late String subname;// = 'Advisor name';
  late String teacher;// = 'Advisor name';
   late int period;// = '  ';
  late int day = 0;// = ' Advisor ';

showModalBottomSheet(
  isScrollControlled: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))
  ),
    context: context, 
    builder: ((context) {
      return 
  Padding(
    // ///////////////////////////////////////for 
    padding:  EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom,left: 18,right: 18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [

        Flexible(child: Text('\n$classid\n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      
        // Flexible(child: SizedBox(height: 50,)),
      Flexible(
        flex: 2,
        child: TextFormField(
          controller: _subName,
          decoration:InputDecoration(
            label: Text('Subject'),
            hintText: 'Subject Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ) ,
        ),
      ),
      Row(
        children: [
          Flexible(
            flex:2,
            child: TextFormField(
              controller: _subId,
              decoration:InputDecoration(
                label: Text('ID'),
                hintText: 'Subject ID',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ) ,
            ),
          ),
          Flexible(
        flex:2,
        child: TextFormField(
          controller: _teacherId,
          decoration:InputDecoration(
            label: Text('Teacher\'s ID'),
            hintText: 'Teacher\'s ID',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ) ,
        ),
      ),
        ],
      ),
      Flexible(
        flex:2,
        child: TextFormField(
          controller: _teacherName,
          decoration:InputDecoration(
            label: Text('Teacher'),
            hintText: 'Teacher\'s Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ) ,
        ),
      ),
      
        Flexible(child: SizedBox(height: 50,)),
      Flex(
        direction: Axis.vertical,
        // flex: 2,
        children:[

        DropdownButtonFormField(
          hint: Text('Select Day'),
          items: numList.map((e) {
            return DropdownMenuItem(
              value: e,
              
              child: Text(_list[e])
              );
          }).toList(), 
          onChanged:( value){
            setState(() {
              
            day = value!;
            });
          }),
        ] 
        // TextFormField(
        //   controller: _day,
        //   decoration:InputDecoration(
        //     label: Text('Day'),
        //     hintText: 'Enter Day',
        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        //   ) ,
        // ),
      ),
        Flexible(child: SizedBox(height: 50,)),
      Flexible(
        flex: 2,
        child: TextFormField(
          controller:_period,
          keyboardType: TextInputType.number,
          decoration:InputDecoration(
            label: Text('Period'),
            hintText: 'Enter perriod number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ) ,
        ),
      ),
      ElevatedButton.icon(
        onPressed: (){
        times = (DateTime.now()).toString();
        subid= _subId.text.trim();
        teacherid= _teacherId.text.trim();
        subname= _subName.text.trim();
        teacher= _teacherName.text.trim();
        // day= _day.text.trim().toLowerCase();
        period = int.parse(_period.text.trim());
        if(subid!='' && subname!='' && period!= null && day !='')
        {
          final value = Mshedule(id: widget.id, days: day, clas: classid, period: period, subj: subname, subjId: subid, times: times,teacherId: teacherid);
          addShedule(widget.id, day, classid, period, subname, subid, times,teacherid,type);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.cyan,
              // margin: EdgeInsets.all(10),
              margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        right: 20,
        left: 20),
  
              content: Text('$subid added'),
              ));
          ////////////////addShedule(day,classid, period,subname, subid,times);
        }
      }, 
     icon:Icon(Icons.add),
      label: Text('Add')),
    ],),
  );
    }
  ));
  }

  void showEditField(int id,String cid,int period,int day,String Sid,double h,double w){
    final _Sname = TextEditingController();
    final _Sid =TextEditingController();
    final _teacherid =TextEditingController();
    final _period =TextEditingController();
    late String _day ='';
    late int days;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('$cid',textAlign: TextAlign.center,),
          content:Container( 
            height:361,
          // ListView(
            // shrinkWrap: true,
            child: Column(children: [

              TextFormField(
                controller: _Sname,
                decoration:const InputDecoration(label: Text('Subject'),hintText: 'Enter Subject Names'),
              ),
              TextFormField(
                controller: _Sid,
                decoration: const InputDecoration(label: Text('Subject ID'),hintText: 'Enter Subject Id'),
              ),
               TextFormField(
                controller: _period,
                decoration: const InputDecoration(label: Text('Period'),hintText: 'Enter Period'),
              ),TextFormField(
                controller: _teacherid,
                decoration: const InputDecoration(label: Text('Teacher ID'),hintText: 'Enter Teacher\'s ID'),
              ),
              Flex(
        direction: Axis.vertical,
        // flex: 2,
        children:[

        DropdownButtonFormField(
          hint: Text('Select Day'),
          items: numList.map((e) {
            return DropdownMenuItem(
              value: e,
              
              child: Text(_list[e])
              );
          }).toList(), 
          onChanged:( value){
            setState(() {
              _day = 'i';
            days = value!;
            });
          }),
        ] 
              ),
              SizedBox(height: h*0.0338,),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            
                Flexible(
                  child: TextButton(child: Text('close'),onPressed: (){Navigator.of(context).pop();},
                  ),
                ),
                Flexible(
                  child: TextButton(onPressed: (){
                
                    if(_Sname.text != "" ){
                       String subN = _Sname.text.trim();
                        updateShedule(id,cid,period,day,'',subN,'','','');
                     
                
                    }
                    if(_Sid.text != "" ){
                       String subId = _Sid.text.trim();
                        updateShedule(id,cid, period,day,subId,'','','','');
                  
                
                    }if(_teacherid.text != "" ){
                       String tId = _teacherid.text.trim();
                        updateShedule(id,cid, period,day,'','','','',tId);
                  
                
                    }
                     if(_day != "" ){
                      setState(() {
                        _day = '';
                      });
                      if(_period.text != '' ){
                       String p = _period.text.trim();
                       updateShedule(id,cid,period,day,'','', p,days.toString(),'');
                
                      }
                     
                       ///////////// // updateShedule(id,period,day,'','', '',days.toString());
                  
                
                    }else if(_period.text != "" ){
                       String cred = _period.text.trim();
                        updateShedule(id,cid,period,day,'','', cred,'','');
                  
                
                    }
                   
                
                    Navigator.of(context).pop();
                  }, child:const Text('Ok')),
                )
                ]
              ),
            )
            ]),
           
          ),
         
        );
      },
    );
  }

}
