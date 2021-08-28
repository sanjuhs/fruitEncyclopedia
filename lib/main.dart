import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/providers/quiz.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl1_gridScreenLanding.dart';
import 'package:myapp8_fruit_encyclopedia/providers/favourites.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // print("GOLOOO");
  // SharedPreferences sharedPreferences;

  // SharedPreferences.getInstance().then((SharedPreferences sp) {
  //   print("soloo");
  //   sharedPreferences = sp;
  //   List<String> qlist = [];
  //   var i = 0;
  //   for (i = 0; i <= 20; i++) {
  //     qlist.add('y');
  //   }
  //   print(qlist);
  //   print("XXXXXX");
  //   sharedPreferences.setStringList('quiz', qlist);
  //   print(sharedPreferences.getStringList('quiz'));
  //   print("quiz is set");
  // });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print("GOLOOO");
    SharedPreferences sharedPreferences;

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      print("soloo");
      sharedPreferences = sp;
      if (sharedPreferences.getStringList('quiz') == null) {
        List<String> qlist = [];
        var i = 0;
        for (i = 0; i <= 20; i++) {
          qlist.add('y');
        }
        print(qlist);
        print("XXXXXX");
        sharedPreferences.setStringList('quiz', qlist);
        print(sharedPreferences.getStringList('quiz'));
        print("quiz is set");
        sharedPreferences.setStringList('stickers', qlist);
        sharedPreferences.setBool('quizDone', false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => FruitsInfo(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Favourites(),
        ),
        ChangeNotifierProvider(create: (ctx) => Quiz()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: lvl1GridScreenLanding(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(

//         title: Text(widget.title),
//       ),
//       body: Center(

//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
