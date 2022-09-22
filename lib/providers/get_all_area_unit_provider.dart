

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/get_all_area_unit_model.dart';

class GetAllAreaUnitProvider extends ChangeNotifier{
  List<AreaUnit>? areaUnit=[];
  updateAreaUnit({List<AreaUnit>? newUnit}){
    areaUnit=newUnit;
    notifyListeners();
  }
}