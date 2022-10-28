//This app demonstrates the custom TabController,
//TabBar, and TabBarView Widgets.
//When we use the custom TabController we have to initialize
//early in the lifecycle of the Stateful widget.
//The app also uses the List.map().toList() methods
//to convert a simple list into TabBar and TabBarView
//widgets.
//It also shows the use of mixins, but we will talk
//about that later.

//lifecycle explained from flutter community.
//https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

//Why not to use the DefaultTabController by medium
//https://medium.com/flutterworld/flutter-tabbar-and-tricks-4f36e06025a4

//What are mixins by the flutter community.
//https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3

// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class MyTabbedDemo2 extends StatefulWidget {
  @override
  _MyTabbedDemo2State createState() => _MyTabbedDemo2State();
}

class _MyTabbedDemo2State extends State<MyTabbedDemo2>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
    const Tab(text: 'FUN'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //Instantiation of a TabController.
    //length must not be neg, zero, or null.
    //The vsync property is associated with the SingleTickerProviderStateMixin.
    //This has to do with the animations but we will cover later.
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Demo 2'),
        bottom: TabBar(
          //This TabBar uses the TabController.
          controller: _tabController,
          tabs: myTabs.map((e) {
            return Text(
              e.text!,
              style: const TextStyle(fontSize: 20),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        //This TabBarView uses the TabController.
        controller: _tabController,
        children: myTabs.map((e) {
          final String label = e.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(
                fontSize: 30,
                //color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
