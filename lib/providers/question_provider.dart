import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';


 class Question {
  final String question;
  final String correctanswer;
  final List<dynamic> incanswers;
  Question({this.question, this.correctanswer, this.incanswers});
}

class QuestionProvider with ChangeNotifier {
  List<Question> _questions;
  int index = 0;
  int score = 0;
  bool finish = false;
  final sounds=AudioCache();
  Color answerColor=Colors.white;
 

  List<Question> get questions => _questions;

  void changeQuestion(String answer) {
    if (checkanswer(answer)) {
      score += 1;
    }
    
    Future.delayed(Duration(seconds: 2)).then((_){

    if (index >= _questions.length - 1) {
      finish = true;
    } else {
      index++;
    }
     answerColor=Colors.white;
    notifyListeners();
    });
    
  }

  bool checkanswer(String ans) {
    if (ans == _questions[index].correctanswer) {
      play();
      answerColor=Colors.green;
      notifyListeners();
      return true;
    } else {
      playw();
      answerColor=Colors.red;
     notifyListeners();
      return false;
    }
  }

  Future<void>play()async{
  await sounds.play("sounds/Correct-answer.mp3");
  
  }
  Future<void>playw()async{
  await sounds.play("sounds/Wrong-answer-sound-effect.mp3");
  
  }

  void restart() {
    index = 0;
    score = 0;
    finish = false;
    _questions = [];
    answerColor=Colors.white;
    notifyListeners();
  }

  Future<void> getQuestions() async {
    var url = 'https://opentdb.com/api.php?amount=10&category=18&type=multiple';
    try {
      final response = await http.get(url);
      final extractData =
          json.decode(response.body)['results'] as List<dynamic>;
      final List<Question> loadedQuestions = [];

      extractData.forEach((questions) {
        loadedQuestions.add(Question(
          question: questions['question'],
          correctanswer: questions['correct_answer'],
          incanswers: questions['incorrect_answers'],
        ));
      });

      loadedQuestions.forEach((ans) {
        ans.incanswers.add(ans.correctanswer);
        ans.incanswers.shuffle();
        
      });

      _questions = loadedQuestions;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
