
import 'package:flutter/material.dart';

import '../models/get_user_properties_model.dart';

class GetUserPropertiesProvider extends ChangeNotifier{
  List<UserProperties>? properties=[];
  updateAllProperties({List<UserProperties>? newProperties}){
    properties=newProperties;
    notifyListeners();
  }
}