import 'package:flutter/cupertino.dart';

class Mycl{
  Map<String , ValueNotifier<List<Mttable>>> valueNotifiers2 ={};

void createValueNotifier(String name){
  valueNotifiers2[name] =ValueNotifier([]);
}
ValueNotifier<List<Mttable>> getValueNotfier(String name){
  return valueNotifiers2[name]!;
}
void deleteValueNotifier(String name){
  valueNotifiers2.remove(name);
}
}

class Mclasses{
  // final String  classs ;
  final String advicor;
  final String ClassId;
  final int id;

  Mclasses({required this.id,required this.ClassId,required this.advicor});

  static Mclasses fromMap(Map<String,Object?>map){ 
    final ClassId= map['ClassId'] as String ;
    // final name = map['Name'] as String;
    final adv = map['advisor'] as String;
    final id = map['id'] as int;
    
    return Mclasses(id:id,ClassId: ClassId,advicor:adv);
  }
}

class Msubject{
  final int id;
  final String subjId;
  final String subjName;
  final String classId;
  final int credit;
  final String teacherName;
  final String teacherId;

  Msubject({required this.id,required this.subjId,required this.subjName,required this.classId,required this.credit,required this.teacherName,required this.teacherId});

  static Msubject fromMap(Map<String,Object?>map){
    final id = map['id'] as int;
    final classId = map['ClassId'] as String;
    final subjId = map['subjectId'] as String;
    final subjName = map['subjName'] as String;
    final credit = map['credit'] as int;
    final teacherId = map['teacherId'] as String;
    final teacherName = map['teacherName'] as String;

    return Msubject(id:id,subjId: subjId, subjName: subjName, classId: classId, credit: credit,teacherId: teacherId,teacherName: teacherName);

  }
}

class Mshedule{
  final int id;
  final int days;
  final String clas;
  final int period;
  final String subj;
  final String subjId;
  final String teacherId;
  final String times;

  Mshedule({required this.id,required this.days,required this.clas,required this.period,required this.subj,required this.subjId,required this.times,required this.teacherId});

  static Mshedule fromMap(Map<String,Object?>map){
    final id = map['id'] as int;
    final day = map['days'] as int ;
    final clas = map['classs'] as String ;
    final period = map['period'] as int;
    final subject = map['subjN'] as String;
    final subjectId = map['subId'] as String;
    final times = map['times'] as String;
    final teacherId = map['teacher'] as String;

    return Mshedule(id:id,days: day, clas: clas, period: period, subj: subject,subjId: subjectId,times: times,teacherId: teacherId);
  }
}

class Mttable{
  final int id;
  final int days;
  final String clas;
  final String period1;
  final String period2;
  final String period3;
  final String period4;
  final String period5;
  final String period6;
  final String period7;
  // final String subj;
  // final String subjId;
  final String times;

  Mttable({required this.id,required this.days,required this.clas,required this.period1,required this.period2,required this.period3,required this.period4,required this.period5,required this.period6,required this.period7,required this.times});

  static Mttable fromMap(Map<String,Object?>map){
    final id= map['id'] as int;
    final day = map['day'] as int ;
    final clas = map['classs'] as String ;
    final period1 = map['period1'] as String;
    final period2 = map['period2'] as String;
    final period3 = map['period3'] as String;
    final period4 = map['period4'] as String;
    final period5 = map['period5'] as String;
    final period6 = map['period6'] as String;
    final period7 = map['period7'] as String;

    // final subject = map['subjN'] as String;
    // final subjectId = map['subId'] as String;
    final times = map['timesh'] as String;

    return Mttable(id:id,days: day, clas: clas, period1: period1, period2: period2, period3: period3, period4: period4, period5: period5, period6: period6,period7: period7,times: times);
  }
}



class login{
 int? id;
  late String name;

  // late String age;
 late String password;
   late String college;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
login({ required this.name,required this.password,required this.college,this.id});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'name' : name,
      'id' : id,
      'password':password,
      'college':college
    };
    return map;
  }

   login.fromMap(Map<String, dynamic> map){
   final id = map['id'] as int ;
     name = map['name'];// as String;
    //  age = map['age'];// as String;
    password = map['password'];// as String;
   // final type = map['type'] as String;
     college = map['college'];// as String;
   
  }
}

class Mall{
  // final String  classs ;
  // final String advicor;
  final String ClassId;
  // final int id;

  Mall({required this.ClassId});

  static Mall fromMap(Map<String,Object?>map){ 
    final ClassId= map['ClassId'] as String ;
    // final name = map['Name'] as String;
    // final adv = map['advisor'] as String;
    // final id = map['id'] as int;
    
    return Mall(ClassId: ClassId);
  }
}
