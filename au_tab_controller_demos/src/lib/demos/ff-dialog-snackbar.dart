//AlertDialog Widget of the Week
//https://www.youtube.com/watch?v=75CsnyRXf5I&vl=en

//SnackBar Widget of the Week
//https://www.youtube.com/watch?v=zpO6n_oZWw0

import 'package:flutter/material.dart';

class AlertDialogAndSnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog and SnackBar Demo'),
      ),
      body: Column(
        children: <Widget>[
          AlertDialogSnackBar(),
        ],
      ),
    );
  }
}

class AlertDialogSnackBar extends StatefulWidget {
  @override
  _AlertDialogSnackBarState createState() => _AlertDialogSnackBarState();
}

class _AlertDialogSnackBarState extends State<AlertDialogSnackBar> {
  @override
  Widget build(BuildContext myScaffoldContext) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: const Text(
          'Press Here',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onTap: () {
          showDialog(
              context: myScaffoldContext,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text(
                    'AlertDialog Text',
                  ),
                  content: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Some Text',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        const snackBar = SnackBar(
                          content: Text(
                            'Snack Bar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(
                            seconds: 2,
                          ),
                        );
                        ScaffoldMessenger.of(myScaffoldContext).showSnackBar(snackBar);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
