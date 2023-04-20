import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final VoidCallback handler;
  final String answer;

  Option(this.handler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
              onPressed: handler, 
              //style: TextStyle(color: Colors.white10),
              child: Text(answer,
                style: TextStyle(fontSize: 25,
                color: Colors.black,
                ),
              ),
            ),
    );
  }
}