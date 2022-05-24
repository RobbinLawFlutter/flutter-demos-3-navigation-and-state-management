import 'package:flutter/material.dart';
import 'package:robbinlaw/models/numberModel.dart';

class NumberCard extends StatelessWidget {
  final NumberModel numberModel;

  const NumberCard({required this.numberModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              numberModel.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  child: Text(
                    numberModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
