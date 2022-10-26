// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/views/second.dart';

class HomeView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX | HomeView"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
              ),
            ),
            ElevatedButton(
              child: const Text("Validate Email"),
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  Get.snackbar(
                    "Email Correct",
                    "Good Email Format",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.snackbar(
                    "Email Incorrect",
                    "Bad Email Format",
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text('Go to Second View'),
              onPressed: () {
                Get.to(SecondView());
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text("Change Theme"),
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }

                print("Screen Height: " + Get.height.toString());
                print("Screen Width: " + Get.width.toString());
                print("Is Device IOS?: " + GetPlatform.isIOS.toString());
                print(
                    "Is Device Android?: " + GetPlatform.isAndroid.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
