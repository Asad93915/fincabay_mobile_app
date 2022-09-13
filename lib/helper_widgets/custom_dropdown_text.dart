import 'package:flutter/cupertino.dart';

import '../configs/text_styles.dart';

class CustomDropDownText extends StatelessWidget {
  final String? text;
  CustomDropDownText({this.text=''}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text!,
        style: headerStyle,
      ),
    );
  }
}
