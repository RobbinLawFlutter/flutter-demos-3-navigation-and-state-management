import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/numbersCarousel.dart';
import 'package:robbinlaw/widgets/numbersList.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NUMBERS Demo'),
      ),
      body: Column(
        children: <Widget>[
          NumbersCarousel(),
          NumbersList(),
        ],
      ),
    );
  }
}
