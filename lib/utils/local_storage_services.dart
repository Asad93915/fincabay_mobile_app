

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

  /////On the base of User Role
  Future saveRoleName(String userRole)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('userRole', userRole);
    return true;
  }
  Future getRoleName()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return  pref.getString('userRole');

  }


}