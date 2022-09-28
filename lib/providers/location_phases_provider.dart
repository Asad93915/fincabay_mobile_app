
import 'package:flutter/cupertino.dart';

import '../models/get_location_phases_model.dart';

class LocationPhasesProvider extends ChangeNotifier{
  List<Location>? phase=[];
  updateLocation({List<Location>? newPhase}){
    phase=newPhase;
    notifyListeners();
  }
}