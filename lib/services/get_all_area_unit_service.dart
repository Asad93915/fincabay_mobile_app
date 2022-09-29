

import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/models/get_all_area_unit_model.dart';
import 'package:fincabay_application/providers/get_all_area_unit_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_configs.dart';

class GetAllAreaUnitService{
  Future getAreaUnit({required BuildContext context,required String categoryType})async{
    try{
      var res=await GetRequestService().httpGetRequest(context: context, url: gatAllAreaUnitsUrl+"category=$categoryType");
      if(res !=null){
        GetAllAreaUnitModel areaUnitModel=GetAllAreaUnitModel.fromJson(res);
        Provider.of<GetAllAreaUnitProvider>(context,listen: false).updateAreaUnit(
          newUnit: areaUnitModel.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get All Area Unit Service $err");
      return null;
        }
  }
}