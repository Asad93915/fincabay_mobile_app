
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/prop_list_model.dart';
import '../providers/prop_list_provider.dart';

class PropertyListService{
  Future getProp({required BuildContext context,required String catName,required int areaSizeId,required int typeId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getAreaSizeViewUrl+"category=$catName&typeid=$typeId&arasizeID=$areaSizeId", context: context);
      if(res!=null) {
        PropertiesListModel areaSizeView=PropertiesListModel.fromJson(res);
        Provider.of<PropertyListProvider>(context,listen: false).updateAreaSizeView(
            newView: areaSizeView.data
        );
        return true;
      }
      else{
        return null;
      }

    }
        catch(err){
      print("Exception in Area Size View Service $err");
      return true;
        }
  }
}