
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/text_styles.dart';

class CustomPropertyCountWidget extends StatelessWidget {
  final String imageUrl;
  final String totalCount;
  CustomPropertyCountWidget({ required this.imageUrl,
    required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return      Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.network("http://173.208.142.67:5955/fincabayapi/${imageUrl}",
          height: MediaQuery.of(context).size.height / 4.5,
          width: 125.0,
          fit: BoxFit.fill,
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 6.0),
            width: 50.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.image_rounded,color: whiteColor,size: 20.0,),
                Text(totalCount,style: lengthStyle),
              ],
            )),
      ],
    );
  }
}
