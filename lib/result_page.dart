import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

// appId = 'ca-app-pub-6396486368076911~4766828795'
// bannerAdUntId = 'ca-app-pub-6396486368076911/1070577622'
// interstitialAdUnitId = 'ca-app-pub-6396486368076911/6131332610'

class ResultPage extends StatefulWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.comments,
  });

  final String bmiResult;
  final String resultText;
  final String comments;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final appId = 'ca-app-pub-6396486368076911~4766828795';
  static const intAdId = 'ca-app-pub-6396486368076911/6131332610';

  @override
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    childDirected: false,
    testDevices: <String>[],
  );

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: NativeAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: appId);
    myInterstitial..load();

    super.initState();
  }

  Widget build(BuildContext context) {
    // myBanner..show();
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
          // Expanded(
          //   child: ReusableCard(
          //     color: kInactiveCardColor,
          //     cardChild: Container(
          //       width: double.infinity,
          //       child: Center(
          //         child: Text(
          //           'I love you maya😘🥰😍',
          //           style: TextStyle(
          //             fontSize: 35.0,
          //             fontWeight: FontWeight.bold,
          //             color: Color(0xFF8D8E98),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

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
                    widget.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    widget.resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.comments,
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
              myInterstitial..show();
            },
          )
        ],
      ),
    );
  }
}
