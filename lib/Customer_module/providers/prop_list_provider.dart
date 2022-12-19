
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/prop_list_model.dart';

class PropertyListProvider extends ChangeNotifier{
  List<PropertyList>? areaView=[];
  updateAreaSizeView({List<PropertyList>? newView}){
    areaView=newView;
    notifyListeners();
  }
}