import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.comments,
  });

  final String bmiResult;
  final String resultText;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Result',
                    style: kResultTitleTextStyle,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'I love you maya😘🥰😍',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    comments,
                    textAlign: TextAlign.center,
                    style: kCommentTextStyle,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
