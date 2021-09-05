import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_FilterDialog.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lvl1_5_gridCard.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/providers/favourites.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lv2FavouritesScreen extends StatefulWidget {
  @override
  _Lv2FavouritesScreenState createState() => _Lv2FavouritesScreenState();
}

class _Lv2FavouritesScreenState extends State<Lv2FavouritesScreen>  with SingleTickerProviderStateMixin{
  List<String> favListIds = [];
  List<Map<String, dynamic>> favListFinal = [];
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

  initiSharedPreferences() {
    // SharedPreferences.setMockInitialValues({
    //   "favourites" : ['1']
    // });
  }

  void loadData() {
    // favListJSON = sharedPreferences.getStringList('favourites');
    // if (favListJSON != null) {
    //   favListJSON.forEach((element) {
    //     Map<String, dynamic> fav = jsonDecode(element);
    //     favListFinal.add(fav);
    //   });
    // }
    // print(favListFinal);
    if (sharedPreferences != null) {
      List<String> df;
      df = sharedPreferences.getStringList('favourites');
      if (df.length != 0) {
        favListIds = df;
      }
      print("id list to be shown below and this is from favourites:");
      print(favListIds);
      print("df below");
      print(df);
      print("XXXXX");
    }

    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    var favouriteFruits = Provider.of<Favourites>(context);
    // var favouriteFruitsList = favouriteFruits.favouriteFruitsListProvider;

    var size = MediaQuery.of(context).size;

    var favouriteFruitsList = [];

    var fruitsData = Provider.of<FruitsInfo>(context);
    var fruitsdisplaydata = fruitsData.fruitsListNew;

   
      //run a loop over ids got from sharedpreferences and map it to fruits
      var i = 0, j = 0;
      for (i = 0; i < favListIds.length; i++) {
        for (j = 0; j < fruitsdisplaydata.length; j++) {
          if (fruitsdisplaydata[j]['id'] == favListIds[i]) {
            favouriteFruitsList.add(fruitsdisplaydata[j]);
          }
        }
      }


    void _sortFruitsTrigger(bool alphabetically) {
      print('got the trigger');

      setState(() {
        fruitsData.sortFruits(alphabetically);
      });
    }

    void _runFilter(keyword) {
      if (keyword.isEmpty) {
        setState(() {
          fruitsdisplaydata = fruitsData.fruitsListNew;
        });
      } else {
        setState(() {
          fruitsData.searchFruitsProvider(keyword);
        });
      }
    }

    void _loadAll() {
      fruitsData.searchFruitsProvider('');
    }

    void showDialogBoxFilter() async {
      // var data = await showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return ChangeNotifierProvider(
      //         create: (ctx) => FruitsInfo(),
      //         child: FilterDialog(
      //           sortHandler: _sortFruitsTrigger,
      //           searchHandler: _runFilter,
      //           resetHandler: _loadAll,
      //         ),
      //       );
      //     });
      // print(data);
      // setState(() {
      //   fruitsData.searchFruitsProvider(data);
      // });
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              // shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 100),
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0.05*size.width, top: 0.05*size.width, bottom: 0.05*size.width),
                  child: Text(
                    'Favourites',
                    style: TextStyle(fontSize: 0.07*size.width, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) => GridCard(
                      favouriteFruitsList[i]['cmnName'],
                      favouriteFruitsList[i]['imgUrl'],
                      favouriteFruitsList[i]['id'],
                      favouriteFruitsList[i]['color1']),
                  // Container(
                  //   child: Text(fruitsdisplaydata[i].title),
                  //   decoration: BoxDecoration(color:fruitsdisplaydata[i].color2 ),),
                  //need to add widget above
                  itemCount: favouriteFruitsList.length,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 10.0),
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
          ],
        ),
      ),
    );
  }
}
