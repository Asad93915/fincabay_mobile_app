
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/models/area_size_view_model.dart';
import 'package:fincabay_application/providers/area_size_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AreaSizeViewService{
  Future getAreaSizeView({required BuildContext context,required String catName,required int areaSizeId,required int typeId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getAreaSizeViewUrl+"category=$catName&typeid=$typeId&arasizeID=$areaSizeId", context: context);
      if(res!=null) {
        AreaSizeViewModel areaSizeView=AreaSizeViewModel.fromJson(res);
        Provider.of<AreaSizeViewProvider>(context,listen: false).updateAreaSizeView(
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