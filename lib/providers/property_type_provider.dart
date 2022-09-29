

import 'package:flutter/cupertino.dart';

import '../models/property_type_model.dart';

class PropertyTypeProvider extends ChangeNotifier{
  List<PropertyTypeModel>? propertyType=[];
  updatePropertyType({List<PropertyTypeModel>? newPropertyType}){
    propertyType=newPropertyType;
    notifyListeners();
  }
}