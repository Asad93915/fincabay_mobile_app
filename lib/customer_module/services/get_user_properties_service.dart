
import 'package:fincabay_application/customer_module/providers/get_user_properties_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';
import '../models/get_user_properties_model.dart';

class GetUserPropertiesService{
  Future getProperties({required BuildContext context,required String userEmail})async{
    try{
      print("User Email $userEmail");
      var res=await GetRequestService().httpGetRequest(url: getUserPropUrl+"Email=$userEmail", context: context);

      if(res!=null){
        print("User Email $userEmail");
        GetUserPropertiesModel getProp=GetUserPropertiesModel.fromJson(res);
        Provider.of<GetUserPropertiesProvider>(context,listen: false).updateAllProperties(
          newProperties: getProp.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get All Properties Service $err");
      return null;
        }
  }
}