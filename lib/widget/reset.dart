import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  final int finalScore;
  final Function reset;
  Reset(this.finalScore, this.reset);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text('Your total score is $finalScore out of 4'),
          alignment: Alignment.center,
        ),
        Container(
          child: ElevatedButton(
            onPressed: reset,
            child: Text('Reset'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.green;
                  return Colors.red; // Use the component's default.
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
