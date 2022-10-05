

import 'package:shared_preferences/shared_preferences.dart';

Future saveString(String token)async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setString('token', token);
  return true;
}
Future getString()async{
  SharedPreferences pref=await SharedPreferences.getInstance();
 String? token= pref.getString('token');
 return token;
}
Future saveUser(String userName)async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setString('userName', userName);
  return true;
}
