

import 'package:flutter/cupertino.dart';

import '../models/get_favourite_property_model.dart';

class GetFavPropProvider extends ChangeNotifier{
  List<FavouriteProperty>? favProp=[];
  updateFavProp({List<FavouriteProperty>? newProp}){
    favProp=newProp;
    notifyListeners();
  }
}