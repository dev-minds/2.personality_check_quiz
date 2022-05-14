// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Custom result widget used to determine quiz score and reset
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  // Values for this arguments are recieved from main.dart file where we
  // set the _totalScore/restQuiz pointers.
  // Meaning Result(_totalScore, _resetQuiz) from line 129 in main.dart
  // determines what resultScore and resetHandler will be
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    // Getter
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Creates a vertical array of children.
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            // style: ButtonStyle(
            //   padding: const EdgeInsets.zero,
            // ),
            child: Text(
              'Restart Quiz!',
            ),
            // textColor: Color.fromARGB(255, 7, 71, 10),
            // resetHandler based on what resetQuiz has been set to
            // after a State reload/rebuild might have happed
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
