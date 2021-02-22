//This app demonstrates a working carousel and GridView.
//It also shows property explicit getters and setters.
//Also how to pass parms down the stateful widget tree.
//Also basic exception throwing.

//Dart getters and setters by geekforgeeks.
//https://www.geeksforgeeks.org/getter-and-setter-methods-in-dart/

//Dart getters and setters by dart.dev.
//https://dart.dev/guides/language/language-tour#getters-and-setters

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:robbinlaw/models/numberModel.dart';
import 'package:robbinlaw/models/numberTypes.dart';

class MyTabbedScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ScopedModel is the top level widget of this
    //state management package. Notice it is a generic
    //that is of type MyModel implemented later in this file.
    return ScopedModel<MyModel>(
      //The ScopedModel widgets model property
      //will instanciate an object from MyModel class.
      model: MyModel(),
      child: Scaffold(
        //backgroundColor: color,
        appBar: AppBar(
          title: Text('Tab and Scoped-Model Demo'),
        ),
        body: Column(
          children: <Widget>[
            //NumbersCarousel(color: Colors.blue),
            //NumbersList(),
          ],
        ),
      ),
    );
  }
}

class MyModel extends Model {
  //This is a private field.
  List<NumberModel> _chosenNumberList = oneTypes;
  //This is a public properties getter.
  List<NumberModel> get chosenNumberList => _chosenNumberList;
  //This is a public properties setter.
  set chosenNumberList(List<NumberModel> myChosenNumberList) {
    _chosenNumberList = myChosenNumberList;
    //This is called whenever something is changed.
    notifyListeners();
  }
}

class NumbersCard extends StatelessWidget {
  const NumbersCard({this.instantsNumber});

  final NumberModel instantsNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Image.asset(
          instantsNumber.image,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
