
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/providers/location_phases_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_configs.dart';
import '../models/get_location_phases_model.dart';

class LocationPhaseService{
  Future getPhase({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getPhasesUrl, context: context);
      if(res !=null){
        LocationPhasesModel locationPhase=LocationPhasesModel.fromJson(res);
        Provider.of<LocationPhasesProvider>(context,listen: false).updateLocation(
          newPhase: locationPhase.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Location Phase Service $err");
      return null;
        }
  }
}