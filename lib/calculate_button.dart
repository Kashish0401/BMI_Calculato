import 'package:flutter/material.dart';
import 'constants.dart';

class CalculateButton extends StatelessWidget {
  final String txt;
  final Function Func;
  CalculateButton(this.txt, this.Func);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
        color: kbottomContainerColour,
        child: Center(
          child: Text(
            txt,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      onTap: () {
        Func();
      },
    );
  }
}
