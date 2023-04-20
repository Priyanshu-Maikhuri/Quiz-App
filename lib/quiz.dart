import 'package:flutter/material.dart';

import './option.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz({required this.answerQuestion, 
        required this.questions, 
        required this.questionIndex,
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionNum'] as String,),
        //spread operator(...) - it will take the items out from the list passed and push into the surrounding list
        //which in this case is sending to Option constructor
        ...(questions[questionIndex]['options'] as List<Map<String, Object>>).map((answer){
          return Option(() => answerQuestion(answer['score']) ,answer['text'] as String);
        }).toList()
      ],
    );
  }
}