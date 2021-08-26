import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Lv2StickersScreen extends StatefulWidget {
  @override
  _Lv2StickersScreenState createState() => _Lv2StickersScreenState();
}

class _Lv2StickersScreenState extends State<Lv2StickersScreen> {
  List<String> qStatusList;
  SharedPreferences sharedPreferences;

   @override
  void initState() {
    // initiSharedPreferences();
    // SharedPreferences.setMockInitialValues({
    //   "favourites" : ['1']
    // });

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      loadData();
    });
    super.initState();
  }

   void loadData() {
    List<String> df = [];
    df = sharedPreferences.getStringList('quiz');
    print(df);
    if (df.length != 0) {
        setState((){
          qStatusList = df;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
                padding: EdgeInsets.only(left: 40, top: 40, bottom: 20),
                child: Text(
                  'Rewards',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     childAspectRatio: 0.75,
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //   ),
              //   itemBuilder: (context, i) {
              //     qStatusList[i] == 'y' ?
              //   },
              //   // Container(
              //   //   child: Text(fruitsdisplaydata[i].title),
              //   //   decoration: BoxDecoration(color:fruitsdisplaydata[i].color2 ),),
              //   //need to add widget above
              //   itemCount: 15,
              //   padding: const EdgeInsets.only(
              //       left: 10, right: 10, top: 0, bottom: 10.0),
              //   // padding: const EdgeInsets.all(0),
              // ),
      ],
      
    );
  }
}