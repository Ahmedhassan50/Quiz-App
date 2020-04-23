import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/main.dart';
import '../providers/question_provider.dart';

import '../screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  static const routname = '/Result-Screen';

  @override
  Widget build(BuildContext context) {
    final qData = Provider.of<QuestionProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF2D046E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height <=
                    MediaQuery.of(context).size.width
                ? null
                : MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                Text('Result',
                    style: TextStyle(fontSize: 35, color: Colors.white)),
                Text('${qData.score}/10',
                    style: TextStyle(fontSize: 90, color: Color(0xFFFFBA00))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          qData.restart();
                          Navigator.pushReplacementNamed(
                              context, QuizScreen.routname);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            'RESTART',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        color: Color(0xFFFFBA00),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, MyApp.routname);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              'EXIT',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          color: Color(0xFF511AA8)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
