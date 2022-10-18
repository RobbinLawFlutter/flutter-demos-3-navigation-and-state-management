// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/views/second.dart';

const kTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX | Home View"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                "Show Snackbar",
                style: kTextStyle,
              ),
              onPressed: _showSnackBar,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Show Dialog",
                style: kTextStyle,
              ),
              onPressed: _showDialog,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Show Bottom Sheet",
                style: kTextStyle,
              ),
              onPressed: _showBottomSheet,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text(
                "Go To Second View via Get.to",
                style: kTextStyle,
              ),
              onPressed: () {
                Get.to(SecondView());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Go To Second View via Get.toNamed",
                style: kTextStyle,
              ),
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
      content: const Text("Too Easy"),
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Music'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('Video'),
            onTap: () => {},
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      //backgroundColor: Colors.white,
    );
  }
}
