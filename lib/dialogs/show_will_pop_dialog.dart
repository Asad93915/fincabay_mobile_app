
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showWillPopDialog(BuildContext context) {

      return    Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Do you want to close your application?',
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Divider(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            print("No");
                            Navigator.pop(context);
                          },
                          child: Text('No')),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            print("Yes");
                          },
                          child: Text('Yes')),
                    ],
                  )
                ]),
              ),
            ),
          );
}
