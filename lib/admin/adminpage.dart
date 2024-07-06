import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';


class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          title: Text("Admin panel"),


        ),
        body: content(),
    );
  }

 Widget content() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("HOME"),
              ),
            NavigationRailDestination(
              icon: Icon(Icons.ac_unit),
              label: Text("AC"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text("SETTINGs"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.add_box),
              label: Text("ADD"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.content_copy),
              label: Text("CONTENT"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.analytics),
              label: Text("ANALYZE"),
            ),
              ] , selectedIndex: 0)
        ],
      ),
    );
 }
}
