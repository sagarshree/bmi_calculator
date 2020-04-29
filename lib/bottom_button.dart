import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kBottomCardTextStyle,
        )),
        decoration: BoxDecoration(
            color: kBottomCardColor, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
