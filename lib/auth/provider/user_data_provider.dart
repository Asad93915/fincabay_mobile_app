

import 'package:flutter/cupertino.dart';

import '../models/user_response_model.dart';



class UserDataProvider extends ChangeNotifier{
  UserModel? user;
  updateUserData({UserModel? newUser}){
    user=newUser;
    notifyListeners();
  }
}