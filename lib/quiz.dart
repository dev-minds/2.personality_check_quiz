import 'package:flutter/material.dart';

// Custom packages
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  // Nested genereic assignment
  // List of maps which holds strings and object parsed as "questions"
  final int questionIndex;
  final Function answerQuestion;

  // Constructor within the Quiz class is created here
  // This constructor has name arguments which is taken from above vars
  // @required DECORATOR tells that these arguments are required for the constructor
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // Type List full of Map that is made of strings
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            // ... Spread OPERATOR - takes a list and pull all the value from a map
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
          // anonymouse function is defined here
          // function without a name
          // create a function on the fly
          // Function is immediately stored in memory as well
        }).toList() // converts the value a map gives us to list
      ],
    );
  }
}
