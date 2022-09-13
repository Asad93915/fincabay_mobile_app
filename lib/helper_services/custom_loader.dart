import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader {
  static void showLoader(
      {required BuildContext context, String message = 'Please wait'}) {
    AlertDialog androidDialog = AlertDialog(
        content: LoaderContentWidget(
      message: message,
    ));
    print('loader started ..');

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return androidDialog;
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
