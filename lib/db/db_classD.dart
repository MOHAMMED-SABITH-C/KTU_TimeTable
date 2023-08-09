

import 'package:flutter/cupertino.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:sqflite/sqflite.dart';

// class Mycl{
//   Map<String , ValueNotifier<List<Mttable>>> valueNotifiers2 ={};

// void createValueNotifier(String name){
//   valueNotifiers2[name] =ValueNotifier([]);
// }
// ValueNotifier<List<Mttable>> getValueNotfier(String name){
//   return valueNotifiers2[name]!;
// }
// }
final myob=Mycl();

ValueNotifier<List<Mclasses>> clasess = ValueNotifier([]);
ValueNotifier<List<Msubject>> subject = ValueNotifier([]);
ValueNotifier<List<Mshedule>> shedule = ValueNotifier([]);
ValueNotifier<List<Mttable>> ttable = ValueNotifier([]);
ValueNotifier<List<login>> log = ValueNotifier([]);
ValueNotifier<List<Mall>> allsh = ValueNotifier([]);
  late List clist = [];
  //  late ValueNotifier<List<Mttable>>? notifier ;
  //   // valueNotifiers1[ClassId]; 

final _List =[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday'
];
final numList = [0,1,2,3,4];
final periodList = [1,2,3,4,5,6,7];


late Database _database;

Future <void> initial()async{
  _database = await openDatabase(
    'class0013.db',
    version: 2,
    onCreate: (Database db,int version) async {
       await db.execute('CREATE TABLE login (id INTEGER primary key autoincrement ,name TEXT,password TEXT,college TEXT )');

      
      await    db.execute(' Create table classes0 (id integer, ClassId TEXT ,advisor TEXT,sem TEXT, primary key(id,ClassId,sem),FOREIGN KEY (id) REFERENCES login (id)) ');
      //  await db.execute('CREATE TABLE teachers (id TEXT primary key,name TEXT)');
      
      await db.execute('''CREATE TABLE subjects1 (id integer, subjectId TEXT,subjName TEXT,credit INTEGER,ClassId TEXT,teacherName TEXT,teacherId TEXT,sem TEXT,
      FOREIGN KEY (ClassId) REFERENCES classes0 (ClassId)
      FOREIGN KEY (id) REFERENCES login (id),
      FOREIGN KEY (sem) REFERENCES classes0 (sem),
      primary key(id,subjectId,ClassId,sem)
      )''');
  
      // await db.execute('''CREATE TABLE teachers (  )

      // ''');
      await db.execute('''CREATE TABLE shedules (id integer, days INTEGER, classs TEXT , period INTEGER, subjN TEXT,subId TEXT,teacher TEXT,
      times TEXT,
       FOREIGN KEY (teacher) REFERENCES subjects1 (teacherId),
      FOREIGN KEY (classs) REFERENCES classes0 (ClassId) , 
      FOREIGN KEY (id) REFERENCES login (id),
      primary key ( id,days,period,classs ) 
      )''');
      // FOREIGN KEY (subj) REFERENCES subjects (subjectId) ,

      await db.execute('''CREATE TABLE ttable (id Integer, day INTEGER , classs TEXT ,
       period1 TEXT ,period2 TEXT , period3 TEXT , period4 TEXT , period5 TEXT , period6 TEXT,period7 TEXT,
       timesh TEXT,
       FOREIGN KEY (id) REFERENCES login (id),
       FOREIGN KEY (classs) REFERENCES shedules (classs),
       FOREIGN KEY (day) REFERENCES shedules (days),
       FOREIGN KEY (timesh) REFERENCES shedules (times),
       primary key ( id,day,classs )
       
       )''');


    },
  );

  
  // getSubjects();

}
late Database database2;

Future<void>initi()async{
  database2 = await openDatabase(
    'senconddb.db',
    version: 2,
    onCreate: (Database db,int version)async {
      await db.execute('''CREATE TABLE shedules (id integer, days INTEGER, classs TEXT , period INTEGER, subjN TEXT,subId TEXT,teacher TEXT,
      times TEXT,
      primary key ( id,days,period,classs ) 
      )''');
      //  FOREIGN KEY (teacher) REFERENCES subjects1 (teacherId),
      // FOREIGN KEY (classs) REFERENCES classes0 (ClassId) , 
      // FOREIGN KEY (id) REFERENCES login (id),
    },

  );

}
////////////////////////////////////////////////////////login
Future <int> addlog(login log)async{
  final id =await _database.rawInsert('Insert into login ( name,password,college) values (?,?,?)',[log.name,log.password,log.college]);
  getlog(id);
  getClasses(id,'');
  return id;
}

Future<void> getlog(int id) async{

  
 final _values = await _database.rawQuery('SELECT * FROM login',);
 print(_values);
 print ('hitable2');
log.value.clear();

_values.forEach((map1) {
  final objects1= login.fromMap(map1);
 // print(objects1);
  log.value.add(objects1);


  log.notifyListeners();
 });
}

Future<String> SearchUser(String userN , password) async{
  late List? values;
  late int id;
  // User fetchedUser;
 // var obj ;
  final _values = await _database.rawQuery('Select * from login where name = ? and password = ? ',['$userN',password]);
  print(_values);
  if(_values.length>0){
    String value = _values.first.toString();
    values =value.split(',');
        print(values[0]);
        id=int.parse(values[0].replaceFirstMapped('{id: ', (m) => ''));
  getClasses(id,'');

   return '$id'; 
    // return login.fromMap(_values.first);
  }else{
      // return null;
     return '';
  }

  }

  Future<String>searchpass(name,pass,college)async{
  final values;
  if(name != '')
     values = await _database.rawQuery('Select * from login where name = ? and college = ?',[name,college]);
  else{
     values = await _database.rawQuery('Select * from login where password = ? and college = ?',[pass,college]);

  }
  if(values.length>0){
  print(values.first);
    print(values.first.toString());
    return '${values.first.toString()}';
  }
  else
    return '';
}

////////////////////////////////////////////////////////////////class
Future<void >addC(adv,cid,int id) async{
  await _database.rawInsert('Insert into classes0 (id,advisor,ClassId) values (?,?,?)',[id,adv,cid]);
  getClasses(id,'');
  String times;
  for(int i=0;i<5;i++){
    // day = _List[i];
      times = DateTime.now().toString();
    await _database.rawInsert('INSERT INTO ttable ( id,day,classs,period1,period2,period3,period4,period5,period6,period7, timesh ) values (?,?,?,?,?,?,?,?,?,?,?)',[id,i,cid,'','','','','','','',times]);
  }
  myob.createValueNotifier(cid);

}
Future getClasses(int id,type )async{
  final value = await _database.rawQuery(' SELECT * FROM classes0 where id = ? order by ClassId ASC',[id]);
  // print(value);
  if(value.length>0){

  clasess.value.clear();
  value.forEach((element) {
    final obj=Mclasses.fromMap(element);
    clasess.value.add(obj);
    clasess.notifyListeners();
  });
  }else if(clasess.value.length > 0 && type == 'Delete'){
  // attt.value.clear();
  // print('removing');
 clasess.value.removeLast();
 clasess.notifyListeners();
 }else{
  clasess.value.clear();
  clasess.notifyListeners();
 }

  return value;
}

Future<void>updateC(subid,clas,adv,int id) async{
  if(clas !='' )
    await _database.rawUpdate('UPDATE classes0 SET ClassId = ? where ClassId = ? and id = ?',[clas,subid,id]);
  if(adv != '')
    await _database.rawUpdate('UPDATE classes0 SET advisor = ? WHERE ClassId = ? and id = ?',[adv,subid,id]); 
  getClasses(id,'');
}
Future <void> deleC(cid,int id) async{
  await _database.rawDelete('DELETE FROM classes0 where ClassId = ? and id = ?',[cid,id]);
  getClasses(id,'Delete');
  await _database.rawDelete("DELETE FROM ttable where id = ? and classs =?",[id,cid]);
  myob.deleteValueNotifier(cid);
}
/////////////////////////subjects///////////////////
Future<void >addS(int id,sid,sname, int credit,cid,teacher,TeacherId) async{
  await _database.rawInsert('Insert into subjects1 ( id,subjectId,subjName,credit,ClassId,teacherName,teacherId ) values (?,?,?,?,?,?,?)',[id,sid,sname,credit,cid,teacher,TeacherId]);
  getSubjects(cid,id,''); 
}
Future<void>getSubjects(ClassId,id,type)async{
  final value = await _database.rawQuery(' SELECT * FROM subjects1 WHERE ClassId = ? and id = ? order by ClassId ASC',[ClassId,id]);
  // print(value);
  if(value.length>0){
    subject.value.clear();
  value.forEach((el) {
    final obj1=Msubject.fromMap(el);
    subject.value.add(obj1);
    subject.notifyListeners();
  });
  }else if(subject.value.length > 0 && type == 'Delete'){
 subject.value.removeLast();
 subject.notifyListeners();
 }else{
  subject.value.clear();
 subject.notifyListeners();

 }
  
}

Future<void>updateS(int id,cid,sid,subid,subN,String credit,teacher,teacherId) async{
  if(subid !='' )
    await _database.rawUpdate('UPDATE subjects1 SET subjectId = ? where ClassId = ? and id = ? and subjectId = ? ',[subid,cid,id,sid]);
  if(subN != '')
    await _database.rawUpdate('UPDATE subjects1 SET subjName = ? WHERE ClassId = ? and id = ? and subjectId = ? ',[subN,cid,id,sid]); 
  if(credit != '') {
    int cr = int.parse(credit);
    await _database.rawUpdate('UPDATE subjects1 SET credit = ? WHERE ClassId = ? and id = ? and subjectId = ? ',[cr,cid,id,sid]);
  }
  if(teacher != '')
    await _database.rawUpdate('UPDATE subjects1 SET teacherName = ? WHERE ClassId = ? and id = ? and subjectId = ? ',[teacher,cid,id,sid]);
  if(teacherId != '')
    await _database.rawUpdate('UPDATE subjects1 SET teacherId = ? WHERE ClassId = ? and id = ? and subjectId = ? ',[teacherId,cid,id,sid]);
  getSubjects(cid,id,'');
}
Future <void> deleS(id,cid,sid) async{
  await _database.rawDelete('DELETE FROM subjects1 where ClassId =? and subjectId =? and id = ?',[cid,sid,id]);

  getSubjects(cid,id,'Delete');
}
///////////////////////////////////////////////////////////////shedules////////
sheffle(){
// _list.shuffle();
        numList.shuffle();
        periodList.shuffle();
}

Future<void >addShedule(int id,int days,clas, int period,subj,subId,times,teacherId,String type) async{
  // late int periods ;
  late bool occ = false;
  List teacher = teacherId.split(',');
  for(int i = 0;i<teacher.length;i++){

  final value = await _database.rawQuery('SELECT * from shedules Where period =? and days = ? and id = ? and teacher like "%${teacher[i]}%"',[period,days,id]);
  if(value.length>0)
    occ= true;
  }
  // .whenComplete(() {



  if((days == 4 && period == 4) || occ) {
    sheffle();
    days = numList[0];
    period = periodList[0];
    return
     addShedule(id,days, clas, periodList[0], subj, subId, times,teacherId,type);

  }else {
    try{

  await
   _database.rawInsert('Insert into shedules ( id,days,classs,period,subjN,subId,teacher,times ) values (?,?,?,?,?,?,?,?)',[id,days,clas,period,subj,subId,teacherId,times]);//.then((value){
  //  .whenComplete(() {
    // print(value);
      // addttable(id,days, clas, subId, times, period);
      await _database.rawUpdate('UPDATE ttable SET period$period = ? where classs = ? and day =? and id = ?',[subId,clas,days,id]);
      // .whenComplete(() {

         getttable(id,clas);
  //  });
   if(type=="add")
      await database2.rawInsert('Insert into shedules ( id,days,classs,period,subjN,subId,teacher,times ) values (?,?,?,?,?,?,?,?)',[id,days,clas,period,subj,subId,teacherId,times]);

  
  }catch(e){
    print('reached');
    //  print('addShedule shuffling');
    times = (DateTime.now()).toString();
        sheffle();
        days=numList[0];
        ///////////////////////////
  // final valuess = await _database.rawQuery('SELECT * from shedules Where period =? and days = ? and id = ? and classs =? ',[period,days,id,clas]);
  // valuess.forEach((map){
  //   final obj = Mshedule.fromMap(map);
  //   periods = obj.period;
  //   // return 
  //   addShedule(id,days, clas, periodList[0], obj.subj, obj.subjId, obj.times,obj.teacherId).whenComplete((){
  //     updateShedule(id,obj.clas , obj.period, obj.days, subId, subj, '', '', teacherId);
  //     print('samadanamayallo');
  //   });
  // });
  //       if(days == 'friday' && period == 4) {
  //   sheffle();
  //   days = _list[0];
  //   period = periodList[0];
  return
    addShedule(id,days, clas, periodList[0], subj, subId, times,teacherId,type);
  // }else
  // await addttable(days, clas, subId, times, period);
  }

  // await
  //  addttable(id,days, clas, subId, times, period);
  }
  // });

  
  // final v = await _database.rawQuery('SELECT * from shedules where times = ?',[times]);
  // if(v.length > 0)
  // {
    // final val = await _database.rawQuery('SELECT * from ttable where classs = ? and day = ?',[clas,days]);
    // if(val.length <= 0 ) {
    //   await _database.rawInsert('INSERT INTO ttable ( day,classs,period$period , timesh ) values (?,?,?,?)',[days,clas,subId,times]);
    // } else{
    //   await _database.rawUpdate('UPDATE ttable SET period$period = ? where classs = ? and day =?',[subId,clas,days]);
    // }jjj
  // }else{
  //   print('addShedule shuffling 555555555555555');
  //   // times = (DateTime.now()).toString();
  //   _list.shuffle();
  //       numList.shuffle();
  //       periodList.shuffle();
  //       day=_list[numList[0]];
  //   addShedule(day, clas, periodList[0], subj, subId, times);
  // }
  getShedule(clas,id,''); 
}
Future<void>getShedule(ClassId,int id,type)async{
  final value = await _database.rawQuery(' SELECT * FROM shedules WHERE classs = ? and id = ? order by days ASC',[ClassId,id]);
  // print(value);

  if(value.length>0){
  shedule.value.clear();
  value.forEach((el) {
    final obj1=Mshedule.fromMap(el);
    shedule.value.add(obj1);
    shedule.notifyListeners();
  });
}else if(shedule.value.length == 1 && type == 'Delete'){
 shedule.value.removeLast();
 shedule.notifyListeners();
 }else{
  shedule.value.clear();
 shedule.notifyListeners();

 }
}


// addShl(Mshedule shedul){
//   searchShedule(shedul.clas,shedul.subjId);
// }
Future shedul(classId,int id) async{
final val = await _database.rawQuery('SELECT * from subjects1 where ClassId =? and id =?',[classId,id]);
String day;
// var data;
subject.value.clear();
  val.forEach((el) {
    final obj1=Msubject.fromMap(el);
    // subject.value.add(obj1);

    for(int i=0;i<obj1.credit;i++){
      // for(int j=0;j<numList.length;j++){
  String times = (DateTime.now()).toString();

        // _list.shuffle();
        // numList.shuffle();
        // periodList.shuffle();
        sheffle();
        // day=_list[numList[i]];
      //  final she =  Mshedule(id:id,days:numList[0] , clas: obj1.classId, period:periodList[0], subj: obj1.subjName, subjId: obj1.subjId,times: times,teacherId: obj1.teacherId);
      // final data= 
        addShedule(id,numList[0],obj1.classId,periodList[0],obj1.subjName,obj1.subjId,times,obj1.teacherId,"");
      //  .then((value){
      //   if(value != null){
      //     i--;
      //   }
      //  } );
      // if(data == 'Empty' )
      // {
      //   print('emtyane');
      //   i--;
      // }else
      //   print('notEmpty');

      // }

    }
    // subject.notifyListeners();
  });
// for(int i=0;i<val.length;i++)
// {
// //  data = val[i]; 
// }
}

Future<void>getttable(int id,ClassId)async{
  final value = await _database.rawQuery(' SELECT * FROM ttable WHERE classs = ? and id =? order by day ASC',[ClassId,id]);
  print(value);

  ttable.value.clear();
  value.forEach((el) {
    final obj1=Mttable.fromMap(el);
    ttable.value.add(obj1);
    ttable.notifyListeners();
  });
  
}

Future<void> addttable(int id,int day,clas,subId,times,int period)async{
// await _database.rawInsert('INSERT INTO ttable (day , classs , period$period , times)',[day,clas,subId,times]);
// final val = await _database.rawQuery('SELECT * from ttable where classs = ? and day = ? and id =?',[clas,day,id]);
    // if(val.length < 0 ) {
    //   await _database.rawInsert('INSERT INTO ttable ( id,day,classs,period1,period2,period3,period4,period5,period6,period7, timesh ) values (?,?,?,?,?,?,?,?,?,?,?)',[id,day,clas,'','','','','','','',times]);
    //   await _database.rawUpdate('UPDATE ttable SET period$period = ? where classs = ? and day =? and id = ?',[subId,clas,day,id]);
    // } else{
      try{

      await _database.rawUpdate('UPDATE ttable SET period$period = ? where classs = ? and day =? and id = ?',[subId,clas,day,id]).whenComplete(() {

         getttable(id,clas);
      });
      }catch(e){
print('$id,$clas,$day,$period,$subId,$times     +++++++++++++++ $e');

      }
print('$id,$clas,$day,$period,$subId,$times hhhhh');
    // }
}

// Future searchShedule(int id,Mshedule shedul,times) async{
//   final value = await _database.rawQuery('SELECT * from shedules Where classs =? and period =? and days = ? and id = ?',[shedul.clas,shedul.period,shedul.days,id]);
//   // print(value.toString() + 'nononon');
//   if(value.length <= 0 )
//   {
//     // print('searchshsedule');
//     await addShedule(id,shedul.days, shedul.clas, shedul.period, shedul.subj, shedul.subjId,times,shedul.teacherId);
    
//     // final isInsert = await _database.rawQuery('SELECT * from shedules Where times = ? ',[times]);
//     // if(isInsert.length <= 0 ) {
//     //   print('empty');
//     //   return 'Empty';
//     // } else {
//     //   return isInsert;
//     // }
//   }
//   else
//     return value;
// }

Future<void>updateShedule(int id,cId,int periodId,int dayId,subid,subN,String per,String day,String tId) async{
  late int p ;
  final v4;
  final v3;
  int flag=0;
// final f=
 await database2.rawQuery("Select * from shedules where id=? and classs=? and period =? and days = ? ",[id,cId,periodId,day]).then((value) {
  
  if(value.length>0){

  if(subid != '' ) {
       database2.rawUpdate('UPDATE shedules SET subId = ? where classs = ? and period = ? and days =? and id =? ',[subid,cId,periodId,dayId,id]);
    }
  if(subN != '') {
      database2.rawUpdate('UPDATE shedules SET subjN = ? WHERE classs = ? and period = ? and days =? and id =? ',[subN,cId,periodId,dayId,id]);
    }
  if(tId != '') {
     database2.rawUpdate('UPDATE shedules SET teacher = ? WHERE classs = ? and period = ? and days =? and id =? ',[tId,cId,periodId,dayId,id]);
  } 
  if(day != '') {
    if(per != ''){
      p = int.parse(per);
      database2.rawUpdate('UPDATE shedules SET days = ? , period = ? WHERE classs = ? and period = ? and days = ? and id =?',[int.parse(day),p,cId,periodId,dayId,id]);

    }
    else
    {
      database2.rawUpdate('UPDATE shedules SET days = ? WHERE classs = ? and period = ? and days = ? and id =? ',[int.parse(day),cId,periodId,dayId,id]);

    }
  }
  if(per != '') {
    int cr = int.parse(per);
       database2.rawUpdate('UPDATE shedules SET period = ? WHERE classs = ? and period = ? and days =? and id =? ',[cr,cId,periodId,dayId,id]);

  }
    flag=1;
  }
  else{
    
  flag=0;
  } 
});
   late String prevperiod = '';
  if(subid != '' ) {
    await _database.rawUpdate('UPDATE shedules SET subId = ? where classs = ? and period = ? and days =? and id =? ',[subid,cId,periodId,dayId,id]);
    await _database.rawUpdate('UPDATE ttable SET period$periodId = ? where classs = ? and day =? and id =? ',[subid,cId,dayId,id]);
    if(flag==1){

      await database2.rawUpdate('UPDATE shedules SET subId = ? where classs = ? and period = ? and days =? and id =? ',[subid,cId,periodId,dayId,id]);
    }

  }
  if(subN != '') {
    await _database.rawUpdate('UPDATE shedules SET subjN = ? WHERE classs = ? and period = ? and days =? and id =? ',[subN,cId,periodId,dayId,id]);
    if(flag==1){
      print('subNames');

      await database2.rawUpdate('UPDATE shedules SET subjN = ? WHERE classs = ? and period = ? and days =? and id =? ',[subN,cId,periodId,dayId,id]);
    }

    
  } 
  if(tId != '') {
    await _database.rawUpdate('UPDATE shedules SET teacher = ? WHERE classs = ? and period = ? and days =? and id =? ',[tId,cId,periodId,dayId,id]);
    if(flag==1)
      await database2.rawUpdate('UPDATE shedules SET teacher = ? WHERE classs = ? and period = ? and days =? and id =? ',[tId,cId,periodId,dayId,id]);

  } 
  if(day != '') {
    if(per != ''){
      p = int.parse(per);


//  = ? and days = ? and id =?',[int.parse(day),p,cId,periodId,dayId,id]);
      await _database.rawUpdate('UPDATE shedules SET days = ? , period = ? WHERE classs = ? and period = ? and days = ? and id =?',[int.parse(day),p,cId,periodId,dayId,id]);

    if(flag==1)
      await database2.rawUpdate('UPDATE shedules SET days = ? , period = ? WHERE classs = ? and period = ? and days = ? and id =?',[int.parse(day),p,cId,periodId,dayId,id]);

    }
    else
    {
      await _database.rawUpdate('UPDATE shedules SET days = ? WHERE classs = ? and period = ? and days = ? and id =? ',[int.parse(day),cId,periodId,dayId,id]);
    if(flag==1)
        await database2.rawUpdate('UPDATE shedules SET days = ? WHERE classs = ? and period = ? and days = ? and id =? ',[int.parse(day),cId,periodId,dayId,id]);

    }
    
     
      final v2 = await _database.rawQuery('SELECT day from ttable where classs =? and day = ? and id = ? ',[cId,int.parse(day),id]);

      // String day;
      if(v2.length <= 0)
      {
        if(per != ''){
         v4 = await _database.rawQuery('SELECT * from shedules where classs = ? and days = ? and period = ? and id =? ',[cId,int.parse(day),p,id]);
        }else
           v4 = await _database.rawQuery('SELECT * from shedules where classs = ? and days = ? and period = ? and id = ? ',[cId,int.parse(day),periodId,id]);
      
      shedule.value.clear();
      v4.forEach((el) {
        final obj1=Mshedule.fromMap(el);
       addttable(id,int.parse(day),cId,obj1.subjId,obj1.times,obj1.period);
      //  _database.rawUpdate('UPDATE ttable SET period$periodId = ? where classs = ? and day =? ',[obj1.subjId,cId,day]);
      
      });
      }
      else
      {
        if(per != ''){
           v3 = await _database.rawQuery('SELECT * from shedules where classs = ? and days = ? and period = ? and id = ? ',[cId,int.parse(day),p,id]);

        }else
           v3 = await _database.rawQuery('SELECT * from shedules where classs = ? and days = ? and period = ? and id = ? ',[cId,int.parse(day),periodId,id]);
      
      shedule.value.clear();
      v3.forEach((el) {
        final obj1=Mshedule.fromMap(el);
        if(per != '')
          _database.rawUpdate('UPDATE ttable SET period$p = ? where classs = ? and day =? and id =? ',[obj1.subjId,cId,int.parse(day),id]);
        else{
       _database.rawUpdate('UPDATE ttable SET period$periodId = ? where classs = ? and day =? and id = ? ',[obj1.subjId,cId,int.parse(day),id]);
       _database.rawUpdate('UPDATE ttable SET period$periodId = ? where classs = ? and day =? and id = ? ',['',cId,dayId,id]);

        }
      
      });
        }
    // }
  } 
  if(per != '') {
    int cr = int.parse(per);
    await _database.rawUpdate('UPDATE shedules SET period = ? WHERE classs = ? and period = ? and days =? and id =? ',[cr,cId,periodId,dayId,id]);
    if(flag==1)
      await database2.rawUpdate('UPDATE shedules SET period = ? WHERE classs = ? and period = ? and days =? and id =? ',[cr,cId,periodId,dayId,id]);
    final v = await _database.rawQuery('SELECT * from ttable where classs =? and day = ? and id = ?',[cId,dayId,id]);
// String day;
// var data;
ttable.value.clear();
  v.forEach((el) {
    final obj1=Mttable.fromMap(el);
    if(periodId == 1){
    prevperiod = obj1.period1;
    }
    else if(periodId == 2){
    prevperiod = obj1.period2;
    } 
    else if(periodId == 3){
    prevperiod = obj1.period3;
    } else if(periodId == 4){
    prevperiod = obj1.period4;
    } else if(periodId == 5){
    prevperiod = obj1.period5;
    } else if(periodId == 6){
    prevperiod = obj1.period6;
    } 
  });
    await _database.rawUpdate('UPDATE ttable SET period$periodId = ? where classs = ? and day =? and id = ? ',['',cId,dayId,id]);
    await _database.rawUpdate('UPDATE ttable SET period$cr = ? where classs = ? and day =? and id = ? ',[prevperiod,cId,dayId,id]);
  }
  getttable(id,cId);
  getShedule(cId,id,'');
}
Future <void> deleShedule(int id,cid,int day,int p) async{
  await _database.rawDelete('DELETE FROM shedules where classs =? and days =? and period =? and id =?',[cid,day,p,id]);
  final f=await database2.rawQuery('SELECT * FROM shedules where classs =? and days =? and period =? and id =?',[cid,day,p,id]);
  if(f.length>0)  
    await database2.rawDelete('DELETE FROM shedules where classs =? and days =? and period =? and id =?',[cid,day,p,id]);
  await _database.rawUpdate('UPDATE ttable set period$p = ? where classs = ? and day = ? and id = ? ',['',cid,day,id]);
  getSubjects(cid,id,'');
  getShedule(cid,id,'Delete');
  getttable(id,cid);
}

Future <void> delAllShedule(int id,cid) async{
  await _database.rawDelete('DELETE FROM shedules where classs =? and  id =?',[cid,id]);
  // for(int i=1;i<=7;i++)
  await _database.rawUpdate('UPDATE ttable set period1 = ? , period2 = ? , period3 = ? , period4 = ? , period5 = ? , period6 = ? , period7 = ?  where classs = ? and id = ? ',['','','','','','','',cid,id]).whenComplete(() {
    database2.rawQuery("Select * from shedules where classs = ? and id = ?",[cid,id]).then((value) {
      if(value.length>0){
        value.forEach((el){
          final obj = Mshedule.fromMap(el);
          addShedule(obj.id, obj.days, obj.clas, obj.period, obj.subj, obj.subjId, obj.times, obj.teacherId, '');


        });
      }
    });
  },);
  
  // await getSubjects(cid,id,'');
  await getShedule(cid,id,'');
  await getttable(id,cid);
  // await allShedule(id,'Delete');
  
}

Future allShedule(int id,String type)async{
  late ValueNotifier? notif;
  try{
    final value = await _database.rawQuery('Select distinct ClassId from classes0 where id = ? ',[id]);
    print(value);
    
    allsh.value.clear();
      value.forEach((map){
   final obj = Mall.fromMap(map);
  //   String a = obj.ClassId;
  //  final notifier = valueNotifiers[a];
  //   notifier?.value.clear();
  if(type != 'Delete'){
    allsh.value.add(obj);
    allsh.notifyListeners();
    // createValueNotifier(obj.ClassId);
      shedul(obj.ClassId, id).whenComplete((){

     });
  //  print(a);
  }else{
    // for(int i=0;i<5;i++){
    //   for(int j=0;j<7;j++){

    //   _database.rawUpdate('UPDATE ttable set ')
    //   }
    // }
    delAllShedule(id,obj.ClassId);//.whenComplete(() {

    //  notif = valueNotifiers1[obj.ClassId];
    // notif?.value.clear();
    // notif?.notifyListeners();
    // });

  }
    });
  }catch(e){
    print(e.toString()+' hi error');
  }
}
Future allshedpage(int id)async{
  late int length = clist.length;
  late String sub='';
  print (id);
  int flag=0;
  try{
    final value = await _database.rawQuery('Select * from ttable where id = ? order by classs ASC',[id]);
    print(value);
      value.forEach((map){
   final obj = Mttable.fromMap(map);
    String a = obj.clas;
    final notifier = myob.getValueNotfier(a);//valueNotifiers2[a];
    if(sub=='')
    {
      sub= obj.clas;
        // clist[length++]=obj.clas;
      notifier?.value.clear();
      notifier?.value.add(obj);
    notifier?.notifyListeners();
    }else if(sub == obj.clas){
      notifier?.value.add(obj);
    notifier?.notifyListeners();
    }else{
      sub=obj.clas;
      //  clist[length++]=obj.clas;
      notifier?.value.clear();
      notifier?.value.add(obj);
    notifier?.notifyListeners();
    }
    // for(int i=0;i<length;i++){
    //   if(length<=0){
    //     clist[length++]=obj.clas;
    //   notifier?.value.clear();
    //   notifier?.value.add(obj);
    // notifier?.notifyListeners();
    //   }else if(a==clist[i]){
    //     flag=0;
   
    // break;
    //   }else{
    //     flag=1;
    //   }
    // }
    // if(flag!=0)
    //  {
    //   // flag=0;
    //   clist[length++]=obj.clas;
    //   notifier?.value.clear();
    //   notifier?.value.add(obj);
    // notifier?.notifyListeners();
    //  }else{
    //    notifier?.value.add(obj);
    // notifier?.notifyListeners();
    //  }
    // shedul(obj.ClassId, id);
    });
  }catch(e){
    print(e.toString()+' hello error');
  }
  print(clist.length);
  print('paranjapole alle');
   print(clist);
}