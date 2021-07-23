import 'package:flutter/material.dart';

class GridCard extends StatefulWidget {
  //const GridCard({ Key? key }) : super(key: key);

  final String titlee;
  final String imgUrl;
  final int index;
  GridCard(  this.titlee , this.imgUrl , this.index);

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(children: [ 
              SizedBox(width: 10,),
              Expanded( child: Image.asset( widget.imgUrl , fit: BoxFit.cover,) ,),
              SizedBox(width: 10,) ,
            ]),
            Text(widget.titlee),
          ],
        ),
        onTap: (){},
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