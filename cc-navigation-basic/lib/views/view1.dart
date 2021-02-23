import 'package:flutter/material.dart';
import 'package:robbinlaw/views/view2.dart';

class View1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('View 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
