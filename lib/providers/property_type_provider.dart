

import 'package:flutter/cupertino.dart';

import '../models/property_type_model.dart';

class PropertyTypeProvider extends ChangeNotifier{
  List<PropertyType>? propertyType=[];
  updatePropertyType({List<PropertyType>? newPropertyType}){
    propertyType=newPropertyType;
    notifyListeners();
  }
}