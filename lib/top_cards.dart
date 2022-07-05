import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

class TopCards extends StatelessWidget {
  final Color colour;
  final Widget containerChild;

  TopCards(
    this.colour,
    this.containerChild,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: containerChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
