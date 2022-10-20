

import 'package:shared_preferences/shared_preferences.dart';


class LocaleStorageServices{
  Future saveToken(String token)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('token', token);
    return true;
  }
  Future getToken()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token= pref.getString('token');
    return token;
  }
  Future saveUser(String email)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('email', email);
  }
  Future getUserName()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? user=await pref.getString('email');
    return user;
  }

}