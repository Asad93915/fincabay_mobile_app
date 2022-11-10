
import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/text_styles.dart';

class FavouritesScreen extends StatefulWidget {
  final bool isShow;
   FavouritesScreen({this.isShow=false});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return
      widget.isShow==true?Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          leading: Builder(builder: (context) =>
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),
          title: Text("Favourites", style: barStyle,),
        ),
        body: Column(
         children: [
           ////Custom Widget
           Text("Under Progress")
         ],
        ),
      ):
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///Custom Widget
        Center(child: Text("Under Progress")),
      ],
    );
  }
}
