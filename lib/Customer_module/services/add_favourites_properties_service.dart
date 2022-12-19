

import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/api_configs.dart';

class AddFavouritePropertyService{
  Future addFavourite({required BuildContext context,required int pTypeId,required String userId})async{
    try{
      Map _body={"propertyId":pTypeId,"userId":userId};
      var res=await PostRequestService().httpPostRequest(url: addFavUrl, body: _body, context: context);
      if(res!=null){
        print("iddddd $pTypeId");
        print("Property Added in Favourite Successfully");
        return true;
      }
      else{
        print("Property Removed Successfully");

        return null;
      }
    }
        catch(err){
      print("Exception in Add Favourite Property Service $err");
      return null;
        }
  }
}