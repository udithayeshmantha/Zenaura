import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
//import 'package:flutter/widgets.dart';
//import 'package:zenaura/admin/shared/constants/ghaps.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final List<Widget> _widgetOptions =<Widget> [
   Container(

   ),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  late int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text("Admin panel"),
      ),
     bottomNavigationBar: MediaQuery.of(context).size.width < 640?
    BottomNavigationBar(
       onTap: (int index){
         index =0;
         setState(() {
           _selectedIndex = index;

         });
       },

    items: const [
      BottomNavigationBarItem(
    icon: Icon(Icons.supervised_user_circle_rounded),label: 'Users'),

    BottomNavigationBarItem(
    icon: Icon(Icons.manage_history_rounded),label: 'CONTENT MANAGER'),


    BottomNavigationBarItem(
    icon: Icon(Icons.table_view_rounded),label: 'TIMETABLES'),


    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active_rounded),label: 'NOTIFICATION MANAGER'),

    BottomNavigationBarItem(
        icon: Icon(Icons.add),label: 'UPDATES'),

    BottomNavigationBarItem(
    icon: Icon(Icons.report),label: 'REPORTS'),

    BottomNavigationBarItem(
    icon: Icon(Icons.settings),label: 'SETTINGS'),

    BottomNavigationBarItem(
    icon: Icon(Icons.help_outline_rounded),label: 'HELP'),

    BottomNavigationBarItem(
    icon: Icon(Icons.logout_rounded),label:'LOG OUT'),
    ],
    ):null,

  body: Row(

    children: [
      if (MediaQuery.of(context).size.width>=640)
      NavigationRail(
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationRailDestination(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: Text ('USERS')),

        NavigationRailDestination (
            icon: Icon(Icons.manage_history_rounded),label: Text ('CONTENT MANAGER')),

        NavigationRailDestination(
            icon: Icon(Icons.add),label:Text ( 'UPDATES')),

        NavigationRailDestination(
            icon: Icon(Icons.table_view_rounded),label: Text ('TIMETABLES')),

        NavigationRailDestination(
            icon: Icon(Icons.notifications_active_rounded),label: Text( 'NOTIFICATION MANAGER')),

       NavigationRailDestination(
            icon: Icon(Icons.report),label: Text ('REPORTS')),

        NavigationRailDestination(
            icon: Icon(Icons.settings),label: Text( 'SETTINGS')),

        NavigationRailDestination(
            icon: Icon(Icons.help_outline_rounded),label: Text('HELP')),

        NavigationRailDestination(
            icon: Icon(Icons.logout_rounded), label: Text('LOG OUT')),
        ],
      ),
     Expanded(child:  _widgetOptions.elementAt(_selectedIndex),)
],
  ),
    );}


}


