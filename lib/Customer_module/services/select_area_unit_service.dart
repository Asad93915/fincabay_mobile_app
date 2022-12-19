
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/Customer_module/models/select_area_units_model.dart';
import 'package:fincabay_application/Customer_module/providers/select_area_units_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectAreaUnitsService{
  Future selectUnit({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: selectAreaUnitUrl, context: context);
      if(res!=null){
        SelecteAreaUnitModel areaUnitModel=SelecteAreaUnitModel.fromJson(res);
        Provider.of<SelectAreaUnitsProvider>(context,listen: false).updateAreaUnit(
          newArea: areaUnitModel.data
        );
        return true;
      }
      else{
        return null;
      }
    }
    catch(err){
      print("Exception in Select Area Unit Service $err");
      return null;
    }
  }
}