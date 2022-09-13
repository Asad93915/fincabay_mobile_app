

import 'package:flutter/cupertino.dart';

import '../models/area_type_model.dart';

class AreaTypeProvider extends ChangeNotifier{
  List<AreaType>? areaType=[];
  updateAreaType({List<AreaType>? newType})
  {
    areaType=newType;
    notifyListeners();
  }
}