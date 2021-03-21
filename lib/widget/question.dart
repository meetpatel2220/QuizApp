import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final int questionNumber;
  final String questionText;

  Question(this.questionNumber,this.questionText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20, left: 20),
            child: CircleAvatar(
              maxRadius: 28,
              child: Text(
                '#$questionNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
            )),
        Container(
          child: Text(questionText,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
