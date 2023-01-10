import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/Customer_module/models/get_favourite_property_model.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/get_favourite_prop_provider.dart';

class GetFavouritePropService{
  Future getFavProp({required BuildContext context,required String userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getFavPropUrl+"UserId=$userId", context: context);
      if(res!=null){
        print("User Id $userId");

        GetFavouritePropertyModel favProp=GetFavouritePropertyModel.fromJson(res);

        Provider.of<GetFavPropProvider>(context,listen: false).updateFavProp(
            newProp: favProp.data
        );
        return true;
      }
      else{
        return null;
      }

    }
    catch(err){
      print("Exception in Get Favourite Property Service $err");
      return null;
    }
  }
}