import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomLoader {
  static void showLoader(
      {required BuildContext context, String message = 'Please wait'}) {
    // AlertDialog androidDialog = AlertDialog(
    //     content: LoaderContentWidget(
    //   message: message,
    // ));
    final spinkit = SpinKitCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? bgColor : barColor,
          ),
        );
      },
    );;
    print('loader started ..');

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return spinkit;
        });
  }

  static void hideLoader(BuildContext context) {
    print('hiding loader..');
    // Navigator.pop(context);
    Navigator.of(context, rootNavigator: true).pop();
    // Navigator.of(context).pop();
  }
}





class LoaderContentWidget extends StatelessWidget {
  final String message;

  LoaderContentWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('will pop executed -->');
        return false;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoActivityIndicator(
            radius: 16.0,
          ),
          SizedBox(height: 10.0),
          Text(
            message,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

