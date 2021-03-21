import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int currentIndex;
  final Function scoreCount;

  Answer(
      {@required this.questions,
      @required this.currentIndex,
      @required this.scoreCount});

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...(widget.questions[widget.currentIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.green;
                  return Colors.blue; // Use the component's default.
                },
              ),
            ),
               
                child: Text(
                  answer['text'],
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                 
                  widget.scoreCount(answer['score']);
                },
              ),
            ),
            width: double.infinity,
            height: 30,
            alignment: Alignment.center,
            color:Colors.yellow,
          );
        }).toList(),
      ],
    );
  }
}
