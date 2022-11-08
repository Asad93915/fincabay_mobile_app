


import 'package:fincabay_application/helper_services/custom_get_request_service.dart';

import 'package:flutter/cupertino.dart';


import '../../configs/api_configs.dart';
class DeleteAgencyStaffService{
  Future deleteStaff({required BuildContext context,required int staffId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: delStaffUrl+"$staffId", context: context);
      if(res!=null){
        print("Agent Id $staffId");
        print("Staff Deleted Successfully");
        return true;
      }
      else
        {
          return null;
        }
    }
    catch(err){
      print("Exception in Delete Agency Staff Service $err");
      return null;
    }
  }
}