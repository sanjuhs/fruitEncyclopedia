import 'package:flutter/material.dart';

class Quiz with ChangeNotifier {

  List<Map<String, dynamic>> _quizQuestions = [
    {
      'id': '1',
      'questionText':'Which fruit does the above dish use ?',
      'option1':'Orange',
      'option2':'Lemon',
      'option3':'Apple',
      'option4':'Banana',
      'answerText':'Orange',
      'hintText' : 'Yellowish sweet fruit primarily found in India',
      'imgURL': 'images/f_01.webp',
      'stickerURL' : 'images/f_01.webp'
    },
    {
      'id': '2',
      'questionText':'Which fruit does the above dish use 2 ?',
      'option1':'Orange',
      'option2':'Lemon',
      'option3':'Apple',
      'option4':'Banana',
      'answerText':'Banana',
      'hintText' : 'Yellowish sweet fruit primarily found in India',
      'imgURL': 'images/f_01.webp',
      'stickerURL' : 'images/s1.webp'
    },
    {
      'id': '3',
      'questionText':'Which fruit does the above dish use 3 ?',
      'option1':'Orange',
      'option2':'Lemon',
      'option3':'Apple',
      'option4':'Banana',
      'answerText':'Apple',
      'hintText' : 'Yellowish sweet fruit primarily found in India',
      'imgURL': 'images/f_01.webp',
      'stickerURL' : 'images/s1.webp'
    },
  ];


  List<Map<String, dynamic>> get quizQuestionsList => [..._quizQuestions];
   
}
