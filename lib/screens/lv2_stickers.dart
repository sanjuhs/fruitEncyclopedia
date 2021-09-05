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
import 'package:google_fonts/google_fonts.dart';

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
        await rootBundle.loadString("sticker_packs/sticker_packs.json");
    response = json.decode(data);

    //var tempName = response["identifier"];
    //tempInstall = await WhatsAppStickers().isStickerPackInstalled(tempName);

    _checkInstallationStatuses();
  }

  void _checkInstallationStatuses() async {
    var tempName = response["sticker_packs"][0]["identifier"];
    print("temp name is below : ");
    print(tempName);

    tempInstall = await _waStickers.isStickerPackInstalled(tempName);
    print(tempInstall);
    print("XXXX");
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

  void showSticker(String imgPath) async {
    print('showing');
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/' + imgPath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                  style: TextStyle(
                      fontSize: 0.07 * size.width, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, i) =>
                    // GridCard(
                    //     fruitsdisplaydata[i]['cmnName'],
                    //     fruitsdisplaydata[i]['imgUrl'],
                    //     fruitsdisplaydata[i]['id'],
                    //     fruitsdisplaydata[i]['color1']),

                    qStatusList != null && (qStatusList[i] == 'y')
                        ? Container(
                            transform:
                                Matrix4.translationValues(0.0, 20.0, 0.0),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange[400],
                            ),
                          )
                        : GestureDetector(
                            child: Container(
                              transform:
                                  Matrix4.translationValues(0.0, 20.0, 0.0),
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/' +
                                      quizQuestionsList[i]['stickerURL']),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            onTap: () {
                              showSticker(quizQuestionsList[i]['stickerURL']);
                            },
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
              SizedBox(
                height: 0.1 * size.width,
              ),
              Center(
                  child: ElevatedButton(
                
                child: Text(
                  "Add to WhatsApp",
                  style: TextStyle(fontSize: 0.05 * size.width),
                ),
                onPressed: () async {
                  if (qStatusList != null) {
                    int i = 0;
                    for (i = 0; i < qStatusList.length; i++) {
                      print(qStatusList[i]);
                      //if at least one of the entries is 'y', that means all stickers aren't unlocked
                      if (qStatusList[i] == 'y') {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  'Unlock all stickers by answering more quiz questions !',
                                  style: TextStyle(fontSize: 0.04 * size.width),
                                ),
                              );
                            });
                      }
                    }
                  }
                  _waStickers.addStickerPack(
                    packageName: WhatsAppPackage.Consumer,
                    stickerPackIdentifier: response["sticker_packs"][0]
                        ["identifier"],
                    stickerPackName: response["sticker_packs"][0]["name"],
                    listener: (action, result, {error}) => processResponse(
                      action: action,
                      result: result,
                      error: error,
                      successCallback: _checkInstallationStatuses,
                      // () async {
                      //   _checkInstallationStatuses();
                      // },
                      context: context,
                    ),
                  );
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(0.06 * size.width),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
              )),
              SizedBox(
                height: 0.25 * size.width,
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: size.width,
              height: 0.15 * size.width,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 0.15 * size.width),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.4,
                    child: Container(
                      width: 0.3 * size.width,
                      height: 0.3 * size.height,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.quiz_sharp,
                            size: 0.07 * size.width,
                          ),
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
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.only(top: 0.02 * size.width , ),
                          iconSize: 0.07 * size.width,
                          icon: Icon(
                            Icons.star_border_outlined,
                            //color: Colors.grey.shade400,
                            color:Colors.black87,
                            //size: 0.07 * size.width,
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
                          padding: EdgeInsets.only(top: 0.02 * size.width , ),
                          iconSize: 0.07 * size.width,
                          icon: Icon(
                            Icons.home_outlined,
                            //color: Colors.grey.shade400,
                            color:Colors.black87,
                            //size: 0.07 * size.width,
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
                          padding: EdgeInsets.only(top: 0.02 * size.width , ),
                          iconSize: 0.07 * size.width,
                            icon: Icon(
                              Icons.add,
                              //color: Colors.grey.shade400,
                              color:Colors.black87,
                              //size: 0.07 * size.width,
                            ),
                            onPressed: () async {
                              //check if any of the stickers are locked, if so don't add to WhatsApp
                              if (qStatusList != null) {
                                int i = 0;
                                for (i = 0; i < qStatusList.length; i++) {
                                  //if at least one of the entries is 'y', that means all stickers aren't unlocked
                                  if (qStatusList[i] == 'y') {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text(
                                              'Unlock all stickers by answering more quiz questions !',
                                              style: TextStyle(
                                                  fontSize: 0.04 * size.width),
                                            ),
                                          );
                                        });
                                  }
                                }
                              }
                              _waStickers.addStickerPack(
                                packageName: WhatsAppPackage.Consumer,
                                stickerPackIdentifier: response["sticker_packs"]
                                    [0]["identifier"],
                                stickerPackName: response["sticker_packs"][0]
                                    ["name"],
                                listener: (action, result, {error}) =>
                                    processResponse(
                                  action: action,
                                  result: result,
                                  error: error,
                                  successCallback: _checkInstallationStatuses,
                                  //  () async {
                                  //   _checkInstallationStatuses();
                                  // },
                                  context: context,
                                ),
                              );
                            }),
                        IconButton(
                          padding: EdgeInsets.only(top: 0.02 * size.width , ),
                          iconSize: 0.07 * size.width,
                            icon: Icon(
                              Icons.emoji_events_outlined,
                              //color: Colors.grey.shade400,
                              color:Colors.black87,
                              //size: 0.07 * size.width,
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
