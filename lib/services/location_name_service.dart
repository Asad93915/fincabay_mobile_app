

import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/models/location_name_model.dart';
import 'package:fincabay_application/providers/location_name_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper_services/custom_get_request_service.dart';

class GetLocationNameService{
  Future getLocName({required BuildContext context,required int cityId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getLocNameUrl+ "$cityId", context: context);
      if(res!=null){
        LocationNamesModel locName=LocationNamesModel.fromJson(res);
        Provider.of<LocationNameProvider>(context,listen: false).updateLocName(
          newName: locName.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in location Name Service $err");
      return null;
        }
  }
}