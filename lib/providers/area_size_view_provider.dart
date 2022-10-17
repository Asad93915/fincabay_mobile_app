
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/area_size_view_model.dart';

class AreaSizeViewProvider extends ChangeNotifier{
  List<AreaSizeView>? areaView=[];
  updateAreaSizeView({List<AreaSizeView>? newView}){
    areaView=newView;
    notifyListeners();
  }
}