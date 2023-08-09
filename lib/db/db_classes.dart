import 'package:flutter/cupertino.dart';
import 'package:flutter_timetable/db/db_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Mclasses>> classess = ValueNotifier([]);

late Database _db;

Future <void> initialize() async{

_db = await openDatabase(
  ' class0.db ',
  version:2,
  onCreate: (Database db,int version) async {
    db.execute(' Create table classes0 ( ClassId TEXT primary key ,advisor TEXT) ');
  
  },
);

  getClass();

}
Future<void >add(adv,cid) async{
  await _db.rawInsert('Insert into classes0 ( advisor,ClassId) values (?,?)',[adv,cid]);
  getClass();
}
Future<void>getClass()async{
  final value = await _db.rawQuery(' SELECT * FROM classes0 order by ClassId ASC');
  print(value);

  classess.value.clear();
  value.forEach((element) {
    final obj=Mclasses.fromMap(element);
    classess.value.add(obj);
    classess.notifyListeners();
  });
}

Future<void>update(id,clas,adv) async{
  if(clas !='' )
    await _db.rawUpdate('UPDATE classes0 SET ClassId = ? where ClassId = ?',[clas,id]);
  if(adv != '')
    await _db.rawUpdate('UPDATE classes0 SET advisor = ? WHERE ClassId = ?',[adv,id]); 
  getClass();
}
Future <void> dele(cid) async{
  await _db.rawDelete('DELETE FROM classes0 where ClassId = ?',[cid]);
  getClass();
}