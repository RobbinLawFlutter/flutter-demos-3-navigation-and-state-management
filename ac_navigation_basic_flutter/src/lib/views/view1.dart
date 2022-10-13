// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/views/view2.dart';

class View1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'View 1',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Go To View 2',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
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
            ElevatedButton(
              child: const Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
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
