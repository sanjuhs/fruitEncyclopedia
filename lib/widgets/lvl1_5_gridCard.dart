import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl2_fruitDetailScreen.dart';
class GridCard extends StatefulWidget {
  //const GridCard({ Key? key }) : super(key: key);

  final String titlee;
  final String imgUrl;
  final int index;
  final Color color1;
  GridCard(  this.titlee , this.imgUrl , this.index ,this.color1);

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override

  Widget build(BuildContext context) {
    return Card(
      //color: Colors.yellow[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(children: [ 
              SizedBox(width: 10,),
              Expanded( child: Image.asset( 'assets/'+widget.imgUrl , fit: BoxFit.cover,) ,),
              SizedBox(width: 10,) ,
            ]),
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.titlee),
            ) , decoration: BoxDecoration(color: widget.color1 , borderRadius: BorderRadius.circular(5)),),
          ],
        ),
        onTap: (){
          //Navigator.of(context).push( (context) => lvl2_fruitData)
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Lv2FruitDetails( widget.index )));
        },
      )
      
      // TextButton(
      //   onPressed: (){}, 
      //   child: Column(
      //     children: [
      //       Container(child: Image.asset('images/1_apple.jpg' , ), padding: EdgeInsets.all(10),),
      //       Text(widget.titlee),
      //     ],
      //   )
      // ),


    );
  }
}