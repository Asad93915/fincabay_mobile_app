

import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';
import '../models/area_size_model.dart';
import '../providers/area_size_provider.dart';

class GetAllAreaUnitService{
  Future getAreaUnit({required BuildContext context,required  String catName})async{
    try{
      var res=await GetRequestService().httpGetRequest(context: context, url: gatAllAreaUnitsUrl+"category=$catName".toString());
      if(res !=null){
        AreaSizeModel areaUnitModel=AreaSizeModel.fromJson(res);
        Provider.of<AreaSizeProvider>(context,listen: false).updateAreaUnit(
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