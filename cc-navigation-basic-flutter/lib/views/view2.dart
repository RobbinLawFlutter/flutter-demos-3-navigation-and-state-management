import 'package:flutter/material.dart';
import 'package:robbinlaw/views/view1.dart';

class View2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('View 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text('Go To View 1'),
              onPressed: () {
                //Navigate to Screen 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View1(),
                  ),
                );
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Go Back'),
              onPressed: () {
                //Navigate back by popping
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
