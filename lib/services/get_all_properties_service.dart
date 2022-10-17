
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/models/get_all_properties_model.dart';
import 'package:fincabay_application/providers/get_all_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/api_configs.dart';

class GetAllPropertiesService{
  Future getProperties({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getAllPropUrl, context: context);

      if(res!=null){
        GetAllPropertiesModel getProp=GetAllPropertiesModel.fromJson(res);
        Provider.of<GetAllPropertiesProvider>(context,listen: false).updateAllProperties(
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