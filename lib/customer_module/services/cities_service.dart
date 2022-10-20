
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cities_model.dart';
import '../providers/cities_provider.dart';

class CitiesService{
  Future getAllCities({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(context: context, url: allCitiesUrl);
      if(res !=null){
        CitiesModel citiesModel=CitiesModel.fromJson(res);
        Provider.of<CitiesProvider>(context,listen: false).updateCities(
          newCity: citiesModel.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Cities Service $err");
      return null;
        }
  }

}