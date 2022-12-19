
import 'package:flutter/cupertino.dart';

import '../models/select_area_units_model.dart';

class SelectAreaUnitsProvider extends ChangeNotifier{
  List<AreaUnits>? areaUnit=[];
  updateAreaUnit({List<AreaUnits>? newArea}){
    areaUnit=newArea;
    notifyListeners();
  }

}