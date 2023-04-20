import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());  // works for a single statement in main function
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState(); // underscore makes it private i.e., can not be changed from 
                          // anywhere but only when it's used with _
  }
}

class _MyAppState extends State<MyApp>{
  static const _questions = [ //const- sure about the values and will not change at all; final- not sure about the values at compile time
    {
      'questionNum': '\nWhat\'s your favourite color?', 
      'options': [
        {'text': 'Red', 'score': 9},
        {'text': 'White', 'score': 1,},
        {'text': 'Green', 'score': 7,},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Blue', 'score': 5},
      ],
    },
    {
      'questionNum': '\nDo you like meeting new people?', 
      'options': [
        {'text': 'Yes', 'score': 2},
        {'text': 'No', 'score': 7,},
        {'text': 'Sometimes', 'score': 5,},
      ],
    },
    {
      'questionNum': '\nWhat\'s the animal you like?',
      'options': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Cat', 'score': 6},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Horse', 'score': 8},
        {'text': 'Lion', 'score': 4}
      ],
    },
    {
      'questionNum': '\nWhich sports you\'d prefer playing?',
      'options': [
        {'text': 'Cricket', 'score': 7},
        {'text': 'Football', 'score': 10,}, 
        {'text': 'Basketball', 'score': 5},
        {'text': 'Chess', 'score': 3}
      ],
    }
  ];

  var _index = 0;
  var _finalScore = 0;

  void _restart(){
    setState(() {
      _index = _finalScore = 0; //to restart the widget tree
    }); 
  }

  void _answerToQuestion(int credit){
    _finalScore += credit;
    if(_index<_questions.length){
      setState(() {
        _index++;
      });
    }
    print('Index: ${_index}');
  }


  @override // mentions we're deliberately overriding build menthod already present in StatefulWidget class
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _index<_questions.length
        ? Quiz(answerQuestion: _answerToQuestion, 
              questions: _questions, 
              questionIndex: _index)
        : Result(_finalScore, _restart),
      ),
    );
  }
}