import 'package:flutter/material.dart';
import 'package:robbinlaw/views/view1.dart';
import 'package:robbinlaw/views/view2.dart';

class View0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('View 0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text('Go To View 1'),
              onPressed: () {
                //Navigate to View 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View1(),
                  ),
                );
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Go To View 2'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View2(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
