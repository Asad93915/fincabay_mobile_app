

import 'package:shared_preferences/shared_preferences.dart';


class LocaleStorageServices{
  // Future saveToken(String token)async{
  //   SharedPreferences pref=await SharedPreferences.getInstance();
  //   pref.setString('token', token);
  //   return true;
  // }
  // Future getToken()async{
  //   SharedPreferences pref=await SharedPreferences.getInstance();
  //   String? token= pref.getString('token');
  //   return token;
  // }


  Future saveUser(String user)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('user', user);
    // print("Userrrrrrrrrrrrr $user");
  }
  Future getUser()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? user=await pref.getString('user');
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