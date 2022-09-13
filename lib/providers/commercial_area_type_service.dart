
import 'package:flutter/cupertino.dart';

import '../models/commercial_area_type_model.dart';

class CommercialAreaTypeProvider extends ChangeNotifier{
  List<CommercialAreaType>? commercialType=[];

  updateCommercialArea({List<CommercialAreaType>? newCommercialType}){
    commercialType=newCommercialType;
    notifyListeners();
  }
}