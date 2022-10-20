
import 'package:flutter/material.dart';

import '../models/location_name_model.dart';

class LocationNameProvider extends ChangeNotifier{
  List<LocationName>? locName=[];
  updateLocName({List<LocationName>? newName}){
    locName=newName;
    notifyListeners();
  }
}