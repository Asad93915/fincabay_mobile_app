

import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

class DeleteFavouritePropertyService{
  Future delFavProp({required BuildContext context,required String userId,required int propId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: delFavPropUrl+"UserId=$userId&PropertyId=$propId", context: context);
      if(res!=null){
        print("Favaurite Property Deleted Successfully");
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in remove favourite Property Service $err");
      return null;
        }
  }
}