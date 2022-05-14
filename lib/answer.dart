import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // StatelessWidget - A widget that does not require mutable(Changeable) state
  // A stateless widget is a widget that sketches part of the user interface(UI)
  // by building a constellation of other widgets that outlines the user interface more concretely.
  final Function selectHandler;
  // a final property of the class is created
  // valued/data stored in this property(selectHandler) must be a function
  //
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  // A constructor is created
  // values of both properties are stored in this contructor (func/str)

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // class double with infinity property
      // fluid space usage, meaning every space it can take on the scree
      //
      margin: EdgeInsets.all(11),
      child: ElevatedButton(
        // textColor: Colors.white,
        onPressed: selectHandler,
        // onPressed: null, // Helps u lock/disable this onPress behaviour
        child: Text(answerText),
        // color: Color.fromARGB(255, 9, 3, 60),
        // Getting access to fromARGB property from Color class
        //
      ),
    );
  }
}
