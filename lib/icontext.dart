import 'package:flutter/material.dart';
import 'constants.dart';

class IconText extends StatelessWidget {
  final IconData iconnn;
  final String textttt;

  IconText(this.iconnn, this.textttt);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconnn,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textttt,
          style: klabelTextStyleSmaller,
        )
      ],
    );
  }
}
