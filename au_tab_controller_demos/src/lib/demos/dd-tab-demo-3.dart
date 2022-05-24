//This app demonstrates the TabPageSelector widget,
//in conjuntion with the TabController and TabBarView.
//No TabBar on this app.
//Also our first use of IconButton Widget, and PreferredSize Widget,
//and the Card Widget.

import 'package:flutter/material.dart';

class MyTabbedDemo3 extends StatefulWidget {
  @override
  _MyTabbedDemo3State createState() => _MyTabbedDemo3State();
}

class _MyTabbedDemo3State extends State<MyTabbedDemo3>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //Instatiate a TabController.
    _tabController = TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline2;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _nextPage(-1);
          },
        ),
        title: const Text('Tab Demo 3'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {
              _nextPage(1);
            },
          ),
        ],
        //the bottom property only accepts PreferredSizeWidget types.
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: TabPageSelector(
              controller: _tabController,
              //selectedColor: Colors.white,
              selectedColor: textStyle!.color,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((e) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: ChoiceCard(
              choice: e,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;

    if (newIndex < 0 || newIndex > _tabController.length - 1) return;
    _tabController.animateTo(newIndex);
  }
}

class Choice {
  Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BOAT', icon: Icons.directions_boat),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'TRAIN', icon: Icons.directions_railway),
  Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline2;
    return Card(
      //color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 228.0,
              color: textStyle!.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
