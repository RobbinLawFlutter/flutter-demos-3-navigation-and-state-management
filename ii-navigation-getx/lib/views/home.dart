import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/views/second.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX | Home View"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Show Snackbar"),
              onPressed: _showSnackBar,
            ),
            ElevatedButton(
              child: Text("Show Dialog"),
              onPressed: _showDialog,
            ),
            ElevatedButton(
              child: Text("Show Bottom Sheet"),
              onPressed: _showBottomSheet,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("Go To Second View via Get.to"),
              onPressed: () {
                Get.to(SecondView());
              },
            ),
            ElevatedButton(
              child: Text("Go To Second View via Get.toNamed"),
              onPressed: () {
                Get.toNamed("/second");
              },
            )
          ],
        ),
      ),
    );
  }

  _showSnackBar() {
    Get.snackbar(
      "Hey There",
      "Snackbar is easy",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: "Simple Dialog",
      content: Text("Too Easy"),
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
