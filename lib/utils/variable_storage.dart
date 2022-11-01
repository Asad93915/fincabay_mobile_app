


import 'package:shared_preferences/shared_preferences.dart';

Future setVisitorView(selected)async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setBool('selected', selected);

}

Future getVisitorView()async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  if(pref.getBool('selected')==null){
    return false;
  }
  return pref.getBool('selected');
}