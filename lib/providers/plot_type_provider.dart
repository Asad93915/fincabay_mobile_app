
import 'package:flutter/cupertino.dart';

import '../models/plot_type_model.dart';

class PlotTypeProvider extends ChangeNotifier{
  List<PlotType>? plotType=[];
  updateType({List<PlotType>? newType}){
    plotType=newType;
    notifyListeners();
  }
}