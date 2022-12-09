import 'dart:convert';

import 'package:fincabay_application/auth/models/user_response_model.dart';

import 'local_storage_services.dart';

bool validateEmail(String text) {
  if (text.isEmpty) {
    return false;
  }

  if (RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text)) {
    return true;
  } else {
    return false;
  }
}

bool validatePassword(String value){
  // String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}


getUser()async {
  String getUser = await LocaleStorageServices().getUser();
  // user= UserModel.fromJson(jsonDecode(getUserId));
  return UserModel.fromJson(jsonDecode(getUser));
}

getUserEmail()async{
  String getUserId=await LocaleStorageServices().getUser();
  UserModel user=UserModel.fromJson(json.decode(getUserId));
  String email= user.email??"";
  return email;
}
getUserId()async{
  String getUserId=await LocaleStorageServices().getUser();
  UserModel user=UserModel.fromJson(json.decode(getUserId));
  String userId= user.id??"";
  return userId;
}