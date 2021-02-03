import 'package:flutter/material.dart';
import 'package:aqc_navigation_BMI/screens/seventh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0B1034),
        // the 0x means HEX the FF is the transparency,
        //then 0B Red, 10 Green, 34 Blue
        //scaffoldBackgroundColor: Color(0xFF0B1034),
        scaffoldBackgroundColor: Colors.blueGrey[800],
      ),
      home: MySeventhPage(),
    );
  }
}
