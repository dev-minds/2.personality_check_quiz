import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
// Unlocked from binding.dart file in flutter/src/widgets/binding.dart
// runApp takes our widget tree defintions and tries to draw it out on the screen
// The widget tree is how you create your UI;
// you position widgets within each other to build simple and complex layouts
// RunApp essentially calls a build method from your main class(e.g MyApp/_MyAppState extended with StatelessWidget class)

class MyApp extends StatefulWidget {
// MyApp will be based on StatefullWidget class
// MyApp is a class/widget which is the root of your application(app)

  @override
  State<StatefulWidget> createState() {
//  widget implementer notifies State of changes
// createState() - Creates the mutable state for this widget at a given location in the tree
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Another widget created here _MyAppState
  // This widget is the home page of your application, which is stateful
  //
  // with the underscore, we are protecting the class from being
  // manipulated from outside the file - imagine u are coding with
  // other developers and they endup making changes to behaviour of the
  // class from outside this file
  //
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
        // The higher the score, the stranger a person is
        // User does not see this
        // Logic is used behind the scene
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'max', 'score': 5},
        {'text': 'fmbah', 'score': 1},
        {'text': 'nana', 'score': 1},
        {'text': 'jon', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

// This void function or method resets the quiz
// sets questionIndex and totalScore to 0
// Use setState to trigger the "build restart" of the app tree
  void _resetQuiz() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PerSonalityCheck'),
        ),
        // Below with the question mark (ternary condition) in widget flutter language
        // Just like in terraform where u use question as if statement
        // condition on the left(boolean) to execute on the right(action) with colon signifying "else"
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            // This Result function is coming from result.dart
            // We have parsed pointer to the function to both _totalscore/_resetQuiz widget
            : Result(_totalScore, _resetQuiz),
        // here is the else block action of our ternary expression
        // This above Result() class is coming from the result.dart file, and its used to FORWARD
        // The value of the _totalScore and _resetQuiz as positional arguments to the class in result.dart
      ),
    );
  }
}
