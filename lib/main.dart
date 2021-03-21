import 'package:flutter/material.dart';
import 'package:meet/widget/answer.dart';
import 'package:meet/widget/reset.dart';
import './widget/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final question = [
    {
      'questionText': 'what is your name ?',
      'answer': [
        {'text': 'meet', 'score': 0},
        {'text': 'mit', 'score': 1},
        {'text': 'md', 'score': 0},
        {'text': 'patel meet', 'score': 0},
      ]
    },
    {
      'questionText': 'What is your village',
      'answer': [
        {'text': 'chanasma', 'score': 1},
        {'text': 'baroda', 'score': 0},
        {'text': 'surat', 'score': 0},
        {'text': 'patan', 'score': 0},
      ]
    },
    {
      'questionText': 'what is your fav food',
      'answer': [
        {'text': 'Food 1', 'score': 0},
        {'text': 'Food 2', 'score': 0},
        {'text': 'Food 3 fav', 'score': 1},
        {'text': 'Food 4', 'score': 0},
      ]
    },
    {
      'questionText': 'this is last question',
      'answer': [
        {'text': 'Ok 1', 'score': 0},
        {'text': 'Ok 2', 'score': 0},
        {'text': 'Ok 3', 'score': 0},
        {'text': 'Ok 4 last', 'score': 1},
      ]
    }
  ];

  var questionNumber = 1;
  var currentIndex = 0;
  var finalScore = 0;
  void next() {
    setState(() {
      questionNumber = questionNumber + 1;
      currentIndex = currentIndex + 1;
    });
  }

  void reset() {
    setState(() {
      questionNumber = 1;
      currentIndex = 0;
      finalScore=0;
    });
  }

  void scoreCount(int score) {
    finalScore = finalScore + score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: currentIndex < question.length
              ? Column(
                  children: <Widget>[
                   
                   Question(questionNumber,question[currentIndex]['questionText']),

                   // array question , currentIndex,scoreCount
               Answer(questions: question, currentIndex: currentIndex, scoreCount: scoreCount),    
                    Container(
                      child: ElevatedButton(
                        onPressed: next,
                        child: Text('Next'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                  ],
                )
              :
              Reset(finalScore, reset)
              ),
    );
  }
}
