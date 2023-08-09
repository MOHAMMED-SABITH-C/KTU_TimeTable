import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_timetable/allShedule.dart';
import 'package:flutter_timetable/bottomBar.dart';
// import 'package:flutter_timetable/db/db_hiveFunc.dart';
// import 'package:flutter_timetable/db/db_hiveModel.dart';
// import 'package:flutter_timetable/db/db_classes.dart';
// import 'package:flutter_timetable/bottomBarCircleAni.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/login.dart';
// import 'package:flutter_timetable/subjects.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClasses extends StatefulWidget {
   ListClasses({super.key,required this.id});

  late int id = 0;
  // getClass()
  @override
  State<ListClasses> createState() => ListClassesState();
}

class ListClassesState extends State<ListClasses> {
Future<SharedPreferences> _pref = SharedPreferences.getInstance();

    late String ADVISOR1 = 'Enter Name';
  late String ADVISOR2 = 'Enter Name';

  late String class2 = '';
  late String class1 = '';
  int groupValue=1;

  void initState(){
    super.initState();
    getId();
    getClasses(widget.id,'');
    // getSubjects();
  }
  @override
  Widget build(BuildContext context) {
    double Mwidth = MediaQuery.of(context).size.width*0.34;
    double Mheight = MediaQuery.of(context).size.height*0.20;
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('CLASSES'),centerTitle: true,
      //   ),
      body: SafeArea(

        child:Container(
          // Container(
                      height: Mheight/0.20,
                      width: Mwidth/0.34,
                    decoration: BoxDecoration(
                      gradient: SweepGradient(
                        center:FractionalOffset.center,
                        colors: [
                          Color(0xFF4285F4),
                          Color(0xFF34A853),
                          Color(0xFFFBBC05),
                          Color(0xFFEA4335),
                          Color(0xFF4285F4),
                        ] ,
                        stops: [0.0,0.25,0.5,0.75,1.0]
                        )
                    ),
                  // );
          child: Center(
            child: ValueListenableBuilder(
              valueListenable:clasess ,
              builder: (BuildContext context,List<Mclasses> classs,Widget? child){
                return ListView.builder(
                  
                  itemBuilder:((context, index) {
                    
                    final data1=classs[index];
                    // final data2 = classs[index++];
                    ADVISOR1 = data1.advicor;
                    class1 = data1.ClassId;
                    // ADVISOR2 = data2.advicor;
                    // class2 = data2.ClassId;
        
                  return 
                  // classs.length >0?
                    // Stack(
                    // children:[ 
                    //   Container(
                    //     height: Mheight,
                    //     width: Mwidth,
                    //   decoration: BoxDecoration(
                    //     gradient: SweepGradient(
                    //       center:FractionalOffset.center,
                    //       colors: [
                    //         Color(0xFF4285F4),
                    //         Color(0xFF34A853),
                    //         Color(0xFFFBBC05),
                    //         Color(0xFFEA4335),
                    //         Color(0xFF4285F4),
                    //       ] ,
                    //       stops: [0.0,0.25,0.5,0.75,1.0]
                    //       )
                    //   ),
                    // );
                   
                    // classs.length <3? Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                        
                    //   ],
                    // )
                                  
                    //  : 
                      Center(
                        // flex: 2,
                        child: SizedBox(
                        height: Mheight*1.4,
                        // width: Mwidth/0.34,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                  onTap: (){
                    getSubjects(data1.ClassId, data1.id,'');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBar(ClassId: data1.ClassId,id:widget.id)));//subjects(classId:data1.ClassId)));
                  },
                  child:Container(
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255).withAlpha(55)
                    ),
                    // alignment: Alignment.center,
                    width:Mwidth*2,
                    height:Mheight,
                    child: Column(children: [
                          SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              SizedBox(height: 10,width: 10,),
                              FocusedMenuHolder(
                                openWithTap: true,
                                menuWidth: Mwidth*1.5,                      child:Icon(Icons.more_vert),
                              // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
                                //  onPressed: (){
        
                                //  },
                                  menuItems: [
                                    FocusedMenuItem(
                                      title: Text('Edit'),
                                      trailingIcon: Icon(Icons.edit),
                                     
                                       onPressed: (){
                                        showDialogField(data1.ClassId,1,Mheight*1.1,Mwidth);
                                        
                                       }),
        
                                       FocusedMenuItem(
                                      title: Text('Open Class'),
                                      trailingIcon: Icon(Icons.open_in_new),
                                      // TextField(
                                      //   controller:_advisor ,
        
                                      // ),
                                       onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>BottomBar(ClassId: data1.ClassId,id:widget.id))));//subjects(classId: data1.ClassId,)))); BottomBarCircleAn())));
                                       }),
                                       FocusedMenuItem(
                                        backgroundColor: Colors.red,
                                      title: Text('Delete Class',style:TextStyle(color: Colors.white)),
                                      trailingIcon: Icon(Icons.delete,color: Colors.white,),
                                      // TextField(
                                      //   controller:_advisor ,
        
                                      // ),
                                       onPressed: (){

                                         getId();
                                         print('delete');
                                        // .whenComplete(
                                          
                                        // if(data1.ClassId != null && widget.id != null){
                                        deleC(data1.ClassId,widget.id);
                                        // }
                                        // );
                                       })
        
                                    ],
                                    onPressed: (){},
                                    )
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text('$class1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 10,),
                          Text('ADVISOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                          SizedBox(height: 10,),
                          Text('$ADVISOR1'),
                    ]),
                  )
                ),
                // 
                              ],
                            )
                          ],
                    ),
                        ),
                      );
                  
                  }) ,
                  itemCount: classs.length,
                  
                  );
        
              }
              ),
          ),
        ) 
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          showBottomSheet(context,'','');
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context){
          //     return 
          // allShed(id:widget.id,ClassId:'S6CSE2');
          //   })
          // );
        },
                                  // elevation:5
        tooltip: 'add classes',
        elevation: 2,
        child: Icon(Icons.add),
        ),
    );
  }

 Future< void> showBottomSheet(BuildContext context,classs,adv)async{
  final _Cid = TextEditingController();
  final _adv = TextEditingController();
  late String hint1 = 'Class name';
  late String hint2 = 'Advisor name';
   late String lab1 = ' Class ';
  late String lab2 = ' Advisor ';
  // late String classs = ;
  // late String adv='';
    _Cid.text=classs;
    _adv.text=adv;
  showModalBottomSheet(
    context: context, 
        isScrollControlled: true,
    builder: ((context) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20) ,
        // color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
        ),
        // height: 300,
        child: Padding(
          // padding: const EdgeInsets.all(18.0),
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,left: 18,right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              
            SizedBox(height: 30,),
            Flexible(
              child: TextFormField(
                controller: _Cid,
                
                decoration: InputDecoration(
                  
                 // fillColor: Colors.white,
                  label: Text(lab1,style: TextStyle(color: Colors.black),),
                  hintText: hint1,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )
              ),
            ),
            Flexible(child: SizedBox(height: 30,)),

            Flexible(
              flex: 2,
              child: TextFormField(
                controller: _adv,
                decoration: InputDecoration(
                  
                  label: Text(lab2,style: TextStyle(color: Colors.black)),
                  hintText: hint2,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Row(
                  children: [
                    Radio(value: 1,
                     groupValue: groupValue,
                     onChanged: ((value){
                      setState(() {
                        groupValue=1;
                        classs=_Cid.text.trim();
                        adv=_adv.text.trim();
                         Navigator.of(context).pop();
                        showBottomSheet(context,classs,adv);
                       
                      });
                    })
                    ),
                    Text('ODD SEMESTER')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2,
                     groupValue: groupValue,
                     onChanged: ((value){
                      setState(() {
                        groupValue=2;
                        classs=_Cid.text.trim();
                        adv=_adv.text.trim();
                         Navigator.of(context).pop();
                        showBottomSheet(context,classs,adv);
                       
                      });
                    })
                    ),
                    Text('EVEN SEMESTER')
                  ],
                )
            ],)
            ,),
            Flexible(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text('close')),
                  TextButton(onPressed: (){

                   late String name= _Cid.text.trim();
                   late String adv = _adv.text.trim();
                   if( name !='' && adv != '')
                    {
                      // addC(adv, name);
                      {/////////////////////
                      if(widget.id != null){

                        final value =  Mclasses(id: widget.id, ClassId: name, advicor: adv);
                      addC(value.advicor,value.ClassId,value.id);
                      }else
                        print('nullalle parayanundo');
                      }


                    Navigator.of(context).pop();
                    }
                    else if(name != ''){
                      hint1 ='Please Enter the Class name';
                      lab1 ='Please Enter the Class name';

                    }else if(adv != '') {
                      hint2 ='Please Enter the Advisor name';
                      lab2 ='Please Enter the Advisor name';

                    } else{
                      hint1 ='Please Enter the Class name';
                      hint2 ='Please Enter the Advisor name';
                      lab1 ='Please Enter the Class name';
                      lab2 ='Please Enter the Advisor name';
                      
                    }
                      
                    
                  }, child: Text('Ok'))
                ],
              ),
            )
            
          ]),
        ),
      );
    })
  );
 }

  void showDialogField(String id,int a,double h,double w){
    final _class = TextEditingController();
    final _advisors =TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('$id',textAlign: TextAlign.center,),
          content:Container( 
            height:h,
          // ListView(
            // shrinkWrap: true,
            child: Column(children: [

              TextFormField(
                controller: _class,
                decoration:const InputDecoration(label: Text('Class'),hintText: 'Enter Class Names'),
              ),
              TextFormField(
                controller: _advisors,
                decoration: const InputDecoration(label: Text('Advisors'),hintText: 'Enter Advisors Names'),
              ),
              SizedBox(height: h*0.0338,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              TextButton(child: Text('close'),onPressed: (){Navigator.of(context).pop();},
              ),
              TextButton(onPressed: (){

                if(_class.text != "" ){
                   String classs = _class.text.trim();


                    updateC(id, classs, '',widget.id);
                  
                  
                  // if(a==1) //{
                  // } else if(a==2) {
                  //   class2 = _class.text.trim();
                  // } 
                  // else if(a==3) {
                  //   class3 = _class.text.trim();
                  // } else {
                  //   class4 = _class.text.trim();
                  // }

                }
                if(_advisors.text != "" ){
                   String ADVISOR = _advisors.text.trim();
                  
                    updateC(id, '', ADVISOR,widget.id);
                  
                  
                  // if(a==1) //{

                  // } else if(a==2) {
                  //   ADVISOR2 = _advisors.text.trim();
                  // }
                  // else if(a==3)
                  //   ADVISOR3 = _advisors.text.trim();
                  // else
                  //   ADVISOR4 = _advisors.text.trim();

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

  Future getId()async{
    final SharedPreferences sp = await _pref;
        if(sp.getInt('id')!= null){

     int _id= sp.getInt('id')!;
     widget.id = _id;
        }
    
  }
}