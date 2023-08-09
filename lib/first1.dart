import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_timetable/listClasses.dart';
import 'package:flutter_timetable/login.dart';
import 'package:flutter_timetable/secondMain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  Future<SharedPreferences> _fu = SharedPreferences.getInstance();
  @override
  void initState(){
      gotoLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(actions: [],title: Text('welcome '),),
      body: Center(
        child: Image.asset('lib/images/contacts.png',height: 200,),
      ),
    );
  }
  
  Future<void> gotoLogin()async{
    // int id;
    final SharedPreferences sp = await _fu;
    await Future.delayed(Duration(seconds: 5));
    // id = 
    if(sp.getInt('id')!= null){

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>tobar(id:sp.getInt('id')!)
    ));
    }
    else{

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>loginPage()
    ));
    }
  }
}