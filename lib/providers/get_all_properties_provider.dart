
import 'package:flutter/material.dart';

import '../models/get_all_properties_model.dart';

class GetAllPropertiesProvider extends ChangeNotifier{
  List<AllProperties>? properties=[];
  updateAllProperties({List<AllProperties>? newProperties}){
    properties=newProperties;
    notifyListeners();
  }
}