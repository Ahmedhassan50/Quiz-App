import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/quiz_screen.dart';
import 'package:provider/provider.dart';
import './providers/question_provider.dart';
import './screens/result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const routname = '/Home-screen';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: QuestionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'ProductSans'),
        home: MyHomePage(),
        routes: {
          QuizScreen.routname: (ctx) => QuizScreen(),
          ResultScreen.routname: (ctx) => ResultScreen(),
          MyApp.routname: (ctx) => MyApp(),
        },
      ),
    );
  }
}
