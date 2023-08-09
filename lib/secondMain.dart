import 'package:flutter/material.dart';
import 'package:flutter_timetable/allShedulePage.dart';
import 'package:flutter_timetable/listClasses.dart';
import 'package:flutter_timetable/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class tobar extends StatefulWidget {
   tobar({super.key,required this.id});
  late int id;
  @override
  State<tobar> createState() => _tobarState();
}

class _tobarState extends State<tobar> with SingleTickerProviderStateMixin {
Future<SharedPreferences> _prefR = SharedPreferences.getInstance();

  late TabController _toptabController = TabController(length: 2, vsync: this);
  // late String str = '';
  late String name='';
  Future<String> sh() async{

   final SharedPreferences sp = await _prefR;
// sp.getString('paswword', password);
    final str = sp.getString('name')!;
   return str;
  }
  void initState(){
    super.initState();
    sh().then((value){

    setState(() {
   name=value;   
    });
    });
  }
 

  @override
  Widget build(BuildContext context) {
    print(widget.id);
  // _child = payment();
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
          //signout(context);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context)=>loginPage()
              ),
              (route)=>false
            );
        }, icon:Icon(Icons.exit_to_app))],
        title: Text("$name"),centerTitle: true,
        bottom: TabBar(
          controller: _toptabController,
          tabs: [
            const Tab(icon: Icon(Icons.maps_home_work_rounded),text: 'CLASSES',),
            // const Tab(icon: Icon(Icons.checkroom_outlined),text: 'checxk',),
            const Tab(icon: Icon(Icons.table_chart_outlined),text: 'TIME TABLES',)
          ]
        ),
        
      ),
     
      backgroundColor: Colors.blue,

      body:
      TabBarView(
        controller: _toptabController,
        children: [
        
        ListClasses(id: widget.id),
       
        shedulepage(id: widget.id)
      ]),
    );
}
}