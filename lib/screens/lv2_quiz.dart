import 'package:flutter/material.dart';

import 'package:myapp8_fruit_encyclopedia/providers/quiz.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv3_correctAnswer.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv3_wrongAnswer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lv2_Quiz extends StatefulWidget {
  @override
  _Lv2_QuizState createState() => _Lv2_QuizState();
}

class _Lv2_QuizState extends State<Lv2_Quiz> {
  SharedPreferences sharedPreferences;
  var index = 0;

  @override
  void initState() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      loadData();
    });
    super.initState();
  }

  void loadData() {
    List<String> df = [];
    df = sharedPreferences.getStringList('quiz');
    print("yoloooo");
    if (df != null) {
      print("hilooooo");
      print(df);
      //flag to check if no unanswered questions are found
      var flag = false;
      var i = 0;
      for (i = 0; i < df.length; i++) {
        print("in loop + ${i}");
        if (df[i] == 'y') {
          flag = true;
          setState(() {
            index = i;
          });
          break;
        }
      }

      //if all ys are replaced with n's then we run the following to reset quiz questions
      if(!flag){
        List<String> qlist = [];
        var i = 0;
        for (i = 0; i <= 20; i++) {
          qlist.add('y');
        }
        print(qlist);
        print("XXXXXX");
        sharedPreferences.setStringList('quiz', qlist);
        print(sharedPreferences.getStringList('quiz'));
        print("quiz is reset");
        //
        sharedPreferences.setBool('quizDone', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizQuestions = Provider.of<Quiz>(context);
    final quizQuestionsList = quizQuestions.quizQuestionsList;

    var questionToLoad = quizQuestionsList[index];

    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        children: [
           Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/'+questionToLoad['imgURL']),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10, top: 35),
            child: Text(
              questionToLoad['questionText'],
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 5.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(10),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(questionToLoad['option1']),
              onPressed: () {
                print("benn presss");
                if (questionToLoad['option1'].toLowerCase() ==
                    questionToLoad['answerText'].toLowerCase()) {
                  //write to sharedpreferences
                  print("if is triggers");
                  var yList = sharedPreferences.getStringList('quiz');
                  yList[index] = 'n';
                  print(yList);
                  sharedPreferences.setStringList('quiz', yList);

                  //only if all quiz questions are answered once then don't update stickers
                  if(sharedPreferences.getBool('quizDone') == false){
                    sharedPreferences.setStringList('stickers', yList);
                  }

                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_CorrectAnswer(
                        stickerURL: questionToLoad['stickerURL'],
                      ),
                    ),
                  );
                } else {
                  print("else is triggers");
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_WrongAnswer(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 5.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(10),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(questionToLoad['option2']),
              onPressed: () {
                if (questionToLoad['option2'].toLowerCase() ==
                    questionToLoad['answerText'].toLowerCase()) {
                  //write to sharedpreferences
                  var yList = sharedPreferences.getStringList('quiz');
                  yList[index] = 'n';

                  sharedPreferences.setStringList('quiz', yList);
                  if(sharedPreferences.getBool('quizDone') == false){
                    sharedPreferences.setStringList('stickers', yList);
                  }
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_CorrectAnswer(
                        stickerURL: questionToLoad['stickerURL'],
                      ),
                    ),
                  );
                } else {
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_WrongAnswer(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 5.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(10),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(questionToLoad['option3']),
              onPressed: () {
                if (questionToLoad['option3'].toLowerCase() ==
                    questionToLoad['answerText'].toLowerCase()) {
                  //write to sharedpreferences
                  var yList = sharedPreferences.getStringList('quiz');
                  yList[index] = 'n';
                  print(yList);
                  sharedPreferences.setStringList('quiz', yList);
                  //print(sharedPreferences.getStringList('favourites'));
                  if(sharedPreferences.getBool('quizDone') == false){
                    sharedPreferences.setStringList('stickers', yList);
                  }
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_CorrectAnswer(
                        stickerURL: questionToLoad['stickerURL'],
                      ),
                    ),
                  );
                } else {
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_WrongAnswer(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 5.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(10),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(questionToLoad['option4']),
              onPressed: () {
                if (questionToLoad['option4'].toLowerCase() ==
                    questionToLoad['answerText'].toLowerCase()) {
                  //write to sharedpreferences
                  var yList = sharedPreferences.getStringList('quiz');
                  yList[index] = 'n';
                  sharedPreferences.setStringList('quiz', yList);
                  if(sharedPreferences.getBool('quizDone') == false){
                    sharedPreferences.setStringList('stickers', yList);
                  }
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_CorrectAnswer(
                        stickerURL: questionToLoad['stickerURL'],
                      ),
                    ),
                  );
                } else {
                  //route to next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lv3_WrongAnswer(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hint'),
                          content: Text(questionToLoad['hintText']),
                        );
                      });
                },
                child: Text('Show Hint')),
          ),
        ],
      ),
    );
  }
}
