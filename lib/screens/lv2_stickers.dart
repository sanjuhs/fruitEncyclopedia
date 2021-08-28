import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/providers/quiz.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv2_favourites.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv2_quiz.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl1_gridScreenLanding.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_FilterDialog.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_navigationBar.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lvl1_5_gridCard.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Lv2StickersScreen extends StatefulWidget {
  @override
  _Lv2StickersScreenState createState() => _Lv2StickersScreenState();
}

class _Lv2StickersScreenState extends State<Lv2StickersScreen> {
  final WhatsAppStickers _waStickers = WhatsAppStickers();
  List<String> qStatusList;
  SharedPreferences sharedPreferences;
  bool tempInstall = true;
  var response;

  void _loadStickers() async {
    String data =
        await rootBundle.loadString("sticker_packs/sticker_pack.json");
    response = json.decode(data);

    var tempName = response["identifier"];
    tempInstall = await WhatsAppStickers().isStickerPackInstalled(tempName);

    _checkInstallationStatuses();
  }

  void _checkInstallationStatuses() async{
     var tempName = response["identifier"];
    tempInstall = await WhatsAppStickers().isStickerPackInstalled(tempName);
  }

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

    _loadStickers();

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
    df = sharedPreferences.getStringList('stickers');
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
    final quizQuestions = Provider.of<Quiz>(context);
    final quizQuestionsList = quizQuestions.quizQuestionsList;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
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
                                color: Colors.orange[400],
                              ),
                            ),
                            onTap: () {
                              showSticker();
                            },
                          )
                        : Container(
                            transform:
                                Matrix4.translationValues(0.0, 20.0, 0.0),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/' +
                                    quizQuestionsList[i]['stickerURL']),
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
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.quiz_sharp),
                        elevation: 0.1,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lv2_Quiz(),
                            ),
                          );
                        }),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.star_border_outlined,
                            color: Colors.grey.shade400,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Lv2FavouritesScreen(),
                              ),
                            );
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.home_outlined,
                            color: Colors.grey.shade400,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => lvl1GridScreenLanding(),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.filter_list_outlined,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              _waStickers.addStickerPack(
                                packageName: WhatsAppPackage.Consumer,
                                stickerPackIdentifier: response['identifier'],
                                stickerPackName: response['name'],
                                listener: (action, result, {error}) => processResponse(
                                  action: action,
                                  result: result,
                                  error: error,
                                  successCallback: () async {
                                    _checkInstallationStatuses();
                                  },
                                  context: context,
                                ),
                              );
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Lv2StickersScreen(),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
