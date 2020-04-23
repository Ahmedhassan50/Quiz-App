import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D046E),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                  child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              )),
              Text(
                'Quiz',
                style: TextStyle(fontSize: 90, color: Color(0xFFA20CBE)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  onPressed: () {
                    Navigator.of(context).pushNamed(QuizScreen.routname);
                  },
                  child: Text(
                    'PLAY',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Color(0xFFFFBA00),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
