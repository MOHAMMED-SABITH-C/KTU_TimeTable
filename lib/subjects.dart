import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/db/db_hiveFunc.dart';
// import 'package:flutter_timetable/db/db_hiveModel.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class subjects extends StatefulWidget {
   subjects({super.key,required this.classId,required this.id});
  late String classId;
  late int id;
  @override
  State<subjects> createState() => _subjectsState();
}

class _subjectsState extends State<subjects> {
  void initState(){
    super.initState();
    getSubjects(widget.classId,widget.id,'');
  }

  // void dipose(){
  //   super.dispose();
  //   getSubjects('');
  // }
  @override
  Widget build(BuildContext context) {
     var ad = Icons.add;
   double mheight =MediaQuery.of(context).size.height;
   double mwidth =MediaQuery.of(context).size.width; 
   var text = RichText(textAlign: TextAlign.center,text: TextSpan(children: [
    TextSpan(text: 'Add\n',style: TextStyle(fontSize: 20)),
    TextSpan(text: '+',style: TextStyle(fontSize: 25,),),

   ]));

    return Scaffold(
      appBar: AppBar(actions: [
        // ElevatedButton(onPressed: (){showBottomSheet(context, mwidth, widget.classId);},
        // //  icon: Icon(Icons.add),
        //   // label: text,//Text('${text.toString}',style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.center,),
        //   child: text,
        //   style: ElevatedButton.styleFrom(
        //     // backgroundColor: Color.fromARGB(151, 93, 13, 108),  
        //     elevation: 50,
            
        //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        //   ),
        //   // onHover: (),
        //   )
        ],
          title: 
      
            Text('${widget.classId}',style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
      centerTitle: true,),
      body: SafeArea(
        child:Stack(
          children:[

           Padding(
            padding: const EdgeInsets.only(left:18,right:18,bottom: 18,top: 50),
            child: ValueListenableBuilder(
              valueListenable: subject,
              builder: (BuildContext context, List<Msubject> subjects,Widget? child) {
                return ListView.separated(
                  itemBuilder: ((context, index) {
                    final data = subjects[index];
                    return Wrap(
                      direction: Axis.horizontal,
                      children: [
                          Card(
                            elevation: 50,
                            color: Color.fromARGB(255, 37, 219, 210),
                            shape: BeveledRectangleBorder( borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0).withAlpha(200),
                                // backgroundBlendMode: BlendMode.color,
                                borderRadius:BorderRadius.all(Radius.circular(8)) ),
                                height: mheight*0.2,
                                width: mwidth*0.2,
                                alignment: Alignment.topCenter,
                                child:Text('\n${data.subjId}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)
                                 ),
            
                                 title: Text(data.subjName),
                                 isThreeLine: true,
                                 subtitle: Text('Credit : ${data.credit}\nTeacher: ${data.teacherName}\nTeacher ID : ${data.teacherId}') ,
                                 trailing: //IconButton(onPressed: (){
                                  FocusedMenuHolder(
                                    menuWidth: mwidth*0.4,
                                    openWithTap: true,
                                    onPressed: (){
        
                                    },
                                    child: Icon(Icons.more_vert_outlined,color: Colors.black,),
                                    menuItems: [
                                        FocusedMenuItem(title: Text('Edit'),
                                         onPressed: (){
                                          showDField(data.id,data.classId,data.subjId, mheight, mwidth);
                                         },
                                         trailingIcon: Icon(Icons.edit)
                                         ),
                                        FocusedMenuItem(backgroundColor: Colors.red,
                                        title: Text('Delete',style: TextStyle(color: Colors.white),),
                                         onPressed: (){

                                          deleS(data.id,data.classId, data.subjId);
                                        } ,
                                        trailingIcon:Icon(Icons.delete,color: Colors.white,) ,),
                                    ],
                                    )
                                //  }, icon:Icon(Icons.more_vert_outlined,color: Colors.black,)
                                // )
                                 ,
                          ),)
                      ],
                    );
                  }),
                   separatorBuilder:((context, index) {
                     return Divider(thickness: 5,color:Colors.transparent ,);
                   }),
                    itemCount: subjects.length
                    );
              
            },),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: (){
          showBottomSheet(context, mwidth,widget.classId);

                },
                 icon: Icon(Icons.add),
                  label: Text('Add Subjects'),
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
          ]
        ) ,
        ),
        // floatingActionButton:
        // FloatingActionButton.extended(onPressed: () {
        //   showBottomSheet(context, mwidth,widget.classId);
        // },
        // label: Text(' Add '),
        // icon: Icon(Icons.add),
        // tooltip: 'add subjects',
        // ),
        // floatingActionButtonLocation:FloatingActionButtonLocation.endFloat
      
    );
  }

  Future <void> showBottomSheet(BuildContext context,double mwidth,String classid) async{
  final _subId = TextEditingController();
  final _subName = TextEditingController();
  final _subClass = TextEditingController();
  final _subCredit = TextEditingController();
  final _teacherId = TextEditingController();
  final _teacher = TextEditingController();
     late String subid;// = 'Subject name';
  late String subname;// = 'Advisor name';
   late int credit;// = '  ';
  late String teacherN;// = ' Advisor ';
  late String teacherId;// = ' Advisor ';
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
        Flexible(child: SizedBox(height: 30,)),
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
      //   Flexible(child: SizedBox(height: 50,)),
      // Flexible(
      //   flex: 2,
      //   child: TextFormField(
      //     controller: _subClass,
      //     decoration:InputDecoration(
      //       label: Text('Class'),
      //       hintText: 'Class ID',
      //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      //     ) ,
      //   ),
      // ),
        Flexible(child: SizedBox(height: 30,)),
      Flexible(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: TextFormField(
                // cursorWidth: 10,
                controller: _subCredit,
                keyboardType: TextInputType.number,
                decoration:InputDecoration(
                  label: Text('No.of Class'),
                  hintText: 'No.of Classes' ,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ) ,
              ),
            ),
            Flexible(
              child: TextFormField(
                // cursorWidth: 10,
            
                controller: _teacherId,
                // keyboardType: TextInputType.number,
                decoration:InputDecoration(
                  label: Text('Teacher\'s ID'),
                  hintText: 'Teacher\'s Id',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ) ,
              ),
            ),
          ],
        ),
        
      ),
        Flexible(child: SizedBox(height: 30,)),

        Flexible(
        flex:2,
        child: TextFormField(
          controller: _teacher,
          decoration:InputDecoration(
            label: Text('Teacher'),
            hintText: 'Teachers Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ) ,
        ),
      ),
      ElevatedButton.icon(
        onPressed: (){
        subid= _subId.text.trim();
        subname= _subName.text.trim();
        teacherN= _teacher.text.trim();
        teacherId= _teacherId.text.trim();
        credit = int.parse(_subCredit.text.trim());
        if(subid!='' && subname!='' && credit!= null && teacherN != '' && teacherId != '')
        {
          final value = Msubject(id: widget.id, subjId: subid, classId: widget.classId, subjName: subname, credit: credit,teacherId: teacherId,teacherName: teacherN);
          addS(value.id,value.subjId,value.subjName,value.credit,value.classId,teacherN,teacherId);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.fixed,
              backgroundColor: Colors.cyan,
              // margin: EdgeInsets.all(10),
        //       margin: EdgeInsets.only(
        // bottom: MediaQuery.of(context).size.height - 150,
        // right: 20,
        // left: 20),
  
              content: Text('$subid added'),
              ));
          

        }
      }, 
     icon:Icon(Icons.add),
      label: Text('add')),
    ],),
  );
    }
  ));
  }

  void showDField(int id,String cid,String Sid,double h,double w){
    final _Sname = TextEditingController();
    final _Sid =TextEditingController();
    final _credit =TextEditingController();
    final _teacher =TextEditingController();
    final _teacherId =TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('$cid',textAlign: TextAlign.center,),
          content:Container( 
            height:344,
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
                controller: _credit,
                decoration: const InputDecoration(label: Text('Credit'),hintText: 'Enter Subject\'s credit'),
              ),
              TextFormField(
                controller: _teacher,
                decoration: const InputDecoration(label: Text('Teacher'),hintText: 'Enter Teacher\'s Name'),
              ),TextFormField(
                controller: _teacherId,
                decoration: const InputDecoration(label: Text('Teacher\'s Id'),hintText: 'Enter Teacher\'s ID'),
              ),
              // SizedBox(height: h*0.0338,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              TextButton(child: Text('close'),onPressed: (){Navigator.of(context).pop();},
              ),
              TextButton(onPressed: (){

                if(_Sname.text != "" ){
                   String subN = _Sname.text.trim();
                    updateS(id,cid,Sid, '',subN,'','','');
                 

                }
                if(_Sid.text != "" ){
                   String subId = _Sid.text.trim();
                    updateS(id,cid, Sid,subId,'','','','');
              

                }
                if(_credit.text != "" ){
                  print('credit va');
                   String cred = _credit.text.trim();
                    updateS(id,cid,Sid,'', '',cred,'','');
              

                }
               if(_teacher.text != "" ){
                   String subT = _teacher.text.trim();
                    updateS(id,cid,Sid, '','','','',subT);
                 

                }if(_teacherId.text != "" ){
                   String subTid = _teacherId.text.trim();
                    updateS(id,cid,Sid, '','','',subTid,'');
                 

                }

                Navigator.of(context).pop();
              }, child:const Text('Ok'))
              ]
            )
            ]),
           
          ),
         
        );
      },
    );
  }
}