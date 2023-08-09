import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_timetable/db/db_hiveModel.dart';
import 'package:flutter_timetable/db/db_classD.dart';
import 'package:flutter_timetable/db/db_classes.dart';
import 'package:flutter_timetable/first1.dart';
// import 'package:hive_flutter/hive_flutter.dart';

Future <void> main() async {
 WidgetsFlutterBinding.ensureInitialized();

      // await Hive.initFlutter();
      // if(!Hive.isAdapterRegistered(MclassesAdapter().typeId)){
      //   Hive.registerAdapter(MclassesAdapter());
      //   await Hive.openBox<Mclasses>('classes');

      // }
      // if(!Hive.isAdapterRegistered(loginAdapter().typeId)){
      //   Hive.registerAdapter(loginAdapter());
      //    await Hive.openBox<login>('log');

      // }
      // if(!Hive.isAdapterRegistered(MsubjectAdapter().typeId)){
      //   Hive.registerAdapter(MsubjectAdapter());
      // }
      // if(!Hive.isAdapterRegistered(MsheduleAdapter().typeId)){
      //   Hive.registerAdapter(MsheduleAdapter());
      // }
      // if(!Hive.isAdapterRegistered(MttableAdapter().typeId)){
      //   Hive.registerAdapter(MttableAdapter());
      // }
    await initialize();
    await initial();
    await initi();
  runApp(app1());
}

class app1  extends StatelessWidget { 
  const app1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( primarySwatch: Colors.purple),

      home: first(),
    );
  }
}