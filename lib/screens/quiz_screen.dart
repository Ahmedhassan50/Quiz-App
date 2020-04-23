import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question_provider.dart';
import '../screens/result_screen.dart';

class QuizScreen extends StatelessWidget {
  static const routname = '/quiz-screen';
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D046E),
      body: FutureBuilder(
        future: Provider.of<QuestionProvider>(context, listen: false)
            .getQuestions(),
        builder: (ctx, snapsot) => snapsot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Consumer<QuestionProvider>(
                  child: Center(child: Text('Please Check the Internet Connection',textAlign: TextAlign.center,style:TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ) ,),),
                  builder: (ctx, qData, child) =>qData.questions==null? child:Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 70,
                                        height: 70,
                                      ),
                                      Text(
                                        '${qData.index+1}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '${qData.questions[qData.index].question}',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    ...(qData.questions[qData.index].incanswers)
                                        .map((quest) => Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 30,
                                                vertical: 8,
                                              ),
                                              child: RaisedButton(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                onPressed: () {
                                                  qData.changeQuestion(
                                                      quest.toString());

                                                      result=quest;
                                                  Future.delayed(Duration(seconds: 2)).then((_){
                                                
                                                  if (qData.finish) {
                                                    
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context,
                                                            ResultScreen
                                                                .routname);
                                                                
                                                  }
                                                  });
                                                  
                                               
                                                },
                                                child: Text(
                                                  quest.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                color: Color(0xFF511AA8),
                                                textColor: quest!=result?Colors.white:qData.answerColor ,
                                                colorBrightness:
                                                    Brightness.dark,
                                              ),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
