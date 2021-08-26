import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_FilterDialog.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_navigationBar.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lvl1_5_gridCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

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

  void showSticker() async {
    print('showing');
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              // transform: Matrix4.translationValues(0.0, 20.0, 0.0),
              // padding: EdgeInsets.all(20),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/f_01.webp'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text('Add to WhatsApp'),
                onPressed: () {},
              )
            ],
          );
        });
  }

  void loadData() {
    List<String> df = [];
    df = sharedPreferences.getStringList('quiz');
    print(df);
    if (df != null) {
      setState(() {
        qStatusList = df;
      });
    }
  }

  void showDialogBoxFilter() async {}

  @override
  Widget build(BuildContext context) {
    var fruitsData = Provider.of<FruitsInfo>(context);
    var fruitsdisplaydata = fruitsData.fruitsListNew;

    return Scaffold(
      body: Stack(children: [
        ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, top: 40, bottom: 0),
              child: Text(
                'Rewards',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) =>
                  // GridCard(
                  //     fruitsdisplaydata[i]['cmnName'],
                  //     fruitsdisplaydata[i]['imgUrl'],
                  //     fruitsdisplaydata[i]['id'],
                  //     fruitsdisplaydata[i]['color1']),
                  qStatusList[i] == 'y'
                      ? GestureDetector(
                          child: Container(
                            transform:
                                Matrix4.translationValues(0.0, 20.0, 0.0),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/f_01.webp'),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          onTap: () {
                            showSticker();
                          },
                        )
                      : Container(
                          transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/f_01.webp'),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
              // Container(
              //   child: Text(fruitsdisplaydata[i].title),
              //   decoration: BoxDecoration(color:fruitsdisplaydata[i].color2 ),),
              //need to add widget above
              itemCount: 15,
              // padding: const EdgeInsets.only(
              //     left: 10, right: 10, top: 0, bottom: 10.0),
              // padding: const EdgeInsets.all(0),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: BottomNavbar(
            showDialogBox: () {
              showDialogBoxFilter();
            },
          ),
        ),
      ]),
    );
  }
}
