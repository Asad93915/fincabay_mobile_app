import 'package:flutter/material.dart';
class ManagePropDrawerWidget extends StatefulWidget {
  final String titleText;
   ManagePropDrawerWidget({required this.titleText});

  @override
  State<ManagePropDrawerWidget> createState() => _ManagePropDrawerWidgetState();
}

class _ManagePropDrawerWidgetState extends State<ManagePropDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(widget.titleText),
        ),
        Divider(),
      ],
    );
  }
}
