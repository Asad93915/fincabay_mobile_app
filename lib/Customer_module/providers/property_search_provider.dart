
import 'package:flutter/material.dart';

import '../models/property_search_model.dart';

class PropertySearchProvider extends ChangeNotifier{
  List<PropertySearch>? propSearch=[];
  updatePropertySearch({List<PropertySearch>? newSearch}){
    propSearch=newSearch;
    notifyListeners();
  }
}