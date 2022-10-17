

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/area_size_model.dart';

class AreaSizeProvider extends ChangeNotifier{
  List<AreaSize>? areaUnit=[];
  updateAreaUnit({List<AreaSize>? newUnit}){
    areaUnit=newUnit;
    notifyListeners();
  }
}