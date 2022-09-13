


import 'package:flutter/cupertino.dart';

import '../models/area_size_model.dart';

class AreaSizeProvider extends ChangeNotifier{
  List<AreaSize>? area=[];
  updateArea({List<AreaSize>? newArea}){
    area=newArea;
    notifyListeners();
  }
}