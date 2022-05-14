import 'package:flutter/material.dart';

// This a custom widget built on the bases of StatelessWidget
// Just like in docker with base image, inheriting everything abt base image
//
class Question extends StatelessWidget {
  final String questionText;
  // This `questionText` variable is a property of the class
  // Reusable around the class and everywhere else in entire app
  // The content is stored in memory

  Question(this.questionText);
  // This is a constructor, where u reuse name of class in the class
  // Argument passed to the question contructor will be stored in
  // questionText string var
  // (this.questionText ---> is a positional argument as we need one argument

  @override
  Widget build(BuildContext context) {
    // Here we are using a container widget from the flutter/src/widets files
    //
    return Container(
      // Container creates an INVICIBLE widget
      // Think a box
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0, top: 10.2),
      // Margin - spacing around the container
      child: Text(
        // Content of the container
        // This portion of the code renders the questions to the screen
        // Check the quiz.dart file and see hw they are called
        // Some confusing contrucs though
        questionText,
        // style argument(named) of the Text widget
        // style argument takes TextStyle object
        // TextStyle then instantiates itself with ()
        // Then TextStyles again takes a couple of its own named arguments
        //
        style: TextStyle(
          fontSize: 18,
          // fontFamily: famil
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
