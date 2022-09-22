
import 'package:fincabay_application/models/user_response_model.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier{
  UserModel? user;
  updateUserData({UserModel? newUser}){
    user=newUser;
    notifyListeners();
  }
}