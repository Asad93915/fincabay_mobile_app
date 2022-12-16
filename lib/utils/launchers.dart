import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper_services/custom_snackbar.dart';
String message =
    "Hey Asad, I am using Fincabay.com app please call me on this number";

 sendMessage(String message, List<String> recipents) async {
  print('i am message $message');
  print('i am recipents $recipents');
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}


launchWhatsapp({required BuildContext context,required String phoneNo}) async{
  var contact = "$phoneNo";
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try{
    if(Platform.isIOS){
      await launchUrl(Uri.parse(iosUrl));
    }
    else{
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception{
    CustomSnackBar.failedSnackBar(context: context, message: "WhatsApp is not installed on the device");
  }
}