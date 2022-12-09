import 'package:flutter/cupertino.dart';

import '../configs/text_styles.dart';

class CustomPropDetailsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  const CustomPropDetailsWidget({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "$imageUrl",
          height: 25.0,
          width: 25.0,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(
          "$title",
          style: iconStyle,
        )
      ],
    );
  }
}
