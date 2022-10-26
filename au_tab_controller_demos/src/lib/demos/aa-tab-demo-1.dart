//This app demonstrates the DefaultTabController,
//TabBar, and TabBarView Widgets.

//DefaultTabController, TabBar with Tabs, and TabBarView Widgets of the week.
//https://www.youtube.com/watch?v=POtoEH-5l40&vl=en

// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyTabbedDemo1 extends StatefulWidget {
  @override
  _MyTabbedDemo1State createState() => _MyTabbedDemo1State();
}

class _MyTabbedDemo1State extends State<MyTabbedDemo1> {
  @override
  Widget build(BuildContext context) {
    //The use of the DefaultTabController does some
    //simple animation automatically.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo 1'),
          bottom: const TabBar(
            //The tabs property must be a list<Tab>.
            tabs: [
              Tab(text: "Car"),
              Tab(
                //This icon does not take on the Theme size.
                icon: Icon(
                  Icons.directions_transit,
                ),
              ),
              Tab(text: "Bike"),
            ],
          ),
        ),
        body: const TabBarView(
          //However many list elements are in the TabBar
          //you must have exactly the same amount in the TabBarView.
          children: [
            Icon(
              Icons.directions_car,
            ),
            Icon(
              Icons.directions_transit,
            ),
            Icon(
              Icons.directions_bike,
            ),
          ],
        ),
      ),
    );
  }
}
