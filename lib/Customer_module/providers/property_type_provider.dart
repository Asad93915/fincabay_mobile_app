

import 'package:flutter/cupertino.dart';

import '../models/property_type_model.dart';

class PropertyTypeProvider extends ChangeNotifier{
  List<PropertyTypeList>? propertyType=[];
  updatePropertyType({List<PropertyTypeList>? newPropertyType}){
    propertyType=newPropertyType;
    notifyListeners();
  }
}