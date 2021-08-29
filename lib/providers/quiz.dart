import 'package:flutter/material.dart';

class Quiz with ChangeNotifier {
  List<Map<String, dynamic>> _quizQuestions = [
    {
      "id": "1",
      "questionText": "Which fruit does the above dish use ?",
      "option1": "Orange",
      "option2": "Lemon",
      "option3": "Mango",
      "option4": "papaya",
      "answerText": "Mango",
      "imgURL": "qp1.webp",
      "hintText": "Yellowish sweet fruit primarily grown in India",
      "stickerURL": "s1.webp"
    },
    {
      "id": "2",
      "questionText":
          "The following dish is called R\u00f8dgr\u00f8d , which fruit does it contain?",
      "option1": "raspberry",
      "option2": "Sapote",
      "option3": "Xigua",
      "option4": "Guava",
      "answerText": "raspberry",
      "imgURL": "qp2.webp",
      "hintText": "The fruit is sweet and red",
      "stickerURL": "s2.webp"
    },
    {
      "id": "3",
      "questionText":
          "This dish is prominemtly served in  Coachella Valley in California , which fruit does it use ?",
      "option1": "Coconut",
      "option2": "Fig",
      "option3": "Date",
      "option4": "blackberries",
      "answerText": "Date",
      "imgURL": "qp3.webp",
      "hintText": "The fruit is grown in the desert , middle east",
      "stickerURL": "s3.webp"
    },
    {
      "id": "4",
      "questionText":
          "This dish is called a duff which fruit does it use usually?",
      "option1": "Date",
      "option2": "Choclate",
      "option3": "Vanilla",
      "option4": "Guava",
      "answerText": "Guava",
      "imgURL": "qp4.webp",
      "hintText": "Sweet , sour , green in the outside",
      "stickerURL": "s4.webp"
    },
    {
      "id": "5",
      "questionText":
          "This jar has a concoction of highly concentrated fruit syrup ,(also called as fruit Butter ) which fruit is this ?",
      "option1": "Banana",
      "option2": "Cherry",
      "option3": "Apple",
      "option4": "Coconut",
      "answerText": "Apple",
      "imgURL": "qp5.webp",
      "hintText": "It is a red , sweet fruit , very famous",
      "stickerURL": "s5.webp"
    },
    {
      "id": "6",
      "questionText":
          "This dish is called Poire \u00e0 la Beaujolaise , what does it contain ?",
      "option1": "Mango",
      "option2": "Pear",
      "option3": "Orange",
      "option4": "Peach",
      "answerText": "Pear",
      "imgURL": "qp6.webp",
      "hintText": "The first word of the dish spells it out ",
      "stickerURL": "s6.webp"
    },
    {
      "id": "7",
      "questionText": "This dish is called _____ fruit pie ?",
      "option1": "Orange",
      "option2": "Ugli",
      "option3": "Lemon",
      "option4": "Mango",
      "answerText": "Lemon",
      "imgURL": "qp7.webp",
      "hintText": "Hint its yellow and sour",
      "stickerURL": "s7.webp"
    },
    {
      "id": "8",
      "questionText":
          "This dish is a traditional georgian dish called ChurchKhela , what does it contain",
      "option1": "Tamarind",
      "option2": "Grapes",
      "option3": "Vanilla",
      "option4": "Orange",
      "answerText": "Grapes",
      "imgURL": "qp8.webp",
      "hintText": "Its also used in wine",
      "stickerURL": "s8.webp"
    },
    {
      "id": "9",
      "questionText":
          "This fruit when put in the above dish , Polarizes many people.",
      "option1": "Lemon",
      "option2": "Banana",
      "option3": "Jackfruit",
      "option4": "Pineapple",
      "answerText": "Pineapple",
      "imgURL": "qp9.webp",
      "hintText": "A spiky fruit",
      "stickerURL": "s9.webp"
    },
    {
      "id": "10",
      "questionText": "This indian dish uses which fruit ?",
      "option1": "Melon",
      "option2": "Jackfruit",
      "option3": "grapefruit",
      "option4": "Date",
      "answerText": "Jackfruit",
      "imgURL": "qp10.webp",
      "hintText": "Called king of fruits , has a very strong flavor ",
      "stickerURL": "s10.webp"
    },
    {
      "id": "11",
      "questionText":
          "Also called Zwetschgenknodel , in german , this dish is sweet ",
      "option1": "banana",
      "option2": "Apricot",
      "option3": "Plum",
      "option4": "Blackberry",
      "answerText": "Plum",
      "imgURL": "qp11.webp",
      "hintText":
          "It is a dumpling with a potato covering , Sweet fruit innards ",
      "stickerURL": "s11.webp"
    },
    {
      "id": "12",
      "questionText":
          "This dish uses a fruit which is then eaten with an indian dish called dosa",
      "option1": "Grapes",
      "option2": "Coconut",
      "option3": "Banana",
      "option4": "Sapote",
      "answerText": "Coconut",
      "imgURL": "qp12.webp",
      "hintText": "This fruit contains water in its core , ",
      "stickerURL": "s12.webp"
    },
    {
      "id": "13",
      "questionText":
          "This dish very famous in china is called sweetheart cake ",
      "option1": "Orange",
      "option2": "Lemon",
      "option3": "cherry",
      "option4": "Melon",
      "answerText": "Melon",
      "imgURL": "qp13.webp",
      "hintText": "Its grown in winter, is large fruit ",
      "stickerURL": "s13.webp"
    },
    {
      "id": "14",
      "questionText": "This famous indian dish uses this ingredient primarily",
      "option1": "Date",
      "option2": "Vanilla",
      "option3": "Nutmeg",
      "option4": "Tamarind",
      "answerText": "Tamarind",
      "imgURL": "qp14.webp",
      "hintText": "Pod like fruit , sour",
      "stickerURL": "s14.webp"
    },
    {
      "id": "15",
      "questionText": "One of the most famous Desserts in the world",
      "option1": "Banana",
      "option2": "Apple",
      "option3": "Peach",
      "option4": "Apricot",
      "answerText": "Banana",
      "imgURL": "qp15.webp",
      "hintText": "Eaten with ice cream, rich in pottasium",
      "stickerURL": "s15.webp"
    }
  ];

  List<Map<String, dynamic>> get quizQuestionsList => [..._quizQuestions];
}
