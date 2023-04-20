import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback restartQuiz;
  final int score;

  Result(this.score, this.restartQuiz);

  String get personality { //getter method
    if(score<12)
      return 'You are pretty Likeable in nature😚';
    else if(score<20)
      return 'You hava an Awesome personality😎';
    else if(score<25)
      return 'You are quite ferocious and audicious🏂🏼';
    else return 'You seems to be suss🤔';
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\n\n\n\n'+personality, 
          style: TextStyle(
            fontSize: 39, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text('\nYour score is: ${score}',
          style: TextStyle(color: Colors.white,),
        ),
        TextButton(
          /*style: OutlinedButton.styleFrom(
            primary: Colors.black,
            side: BorderSide(color: Colors.black),
          ),*/
          onPressed: restartQuiz,
          child: Text('\n\tRestart Quiz?',
          style: TextStyle(color: Colors.deepOrangeAccent,
            fontSize: 25,
            decoration: TextDecoration.underline,),
          ),
        ),
      ],
    );
  }
}