
import 'package:flutter/material.dart';

import '../models/cities_model.dart';

class CitiesProvider extends ChangeNotifier{
  List<Cities>? city=[];
  updateCities({List<Cities>? newCity}){
    city=newCity;
    notifyListeners();
  }
}