import 'package:fincabay_application/Customer_module/providers/get_user_properties_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';
import '../models/get_user_properties_model.dart';

class GetUserPropertiesService extends ChangeNotifier {
  List<UserProperties>? properties=[];
  int pageNo = 1;

  Future getInitProp({required BuildContext context,required String userEmail})async{
  await  getMoreProp(context: context, userEmail: userEmail);
  }

  Future getMoreProp(
      {required BuildContext context, required String userEmail}) async {
    try {
      print("User Email $userEmail");
      var res = await GetRequestService().httpGetRequest(
          url: getUserPropUrl + "Email=$userEmail&pageNo=$pageNo",
          context: context);

      if (res != null) {
        print("User Email $userEmail");
        GetUserPropertiesModel getProp = GetUserPropertiesModel.fromJson(res);
        // Provider.of<GetUserPropertiesProvider>(context, listen: false)
        //     .updateAllProperties(newProperties: getProp.data);

        if(pageNo==1 || properties==[]){
          properties=getProp.data;


        }
        else{

          properties!.addAll(getProp.data!);

        }
        notifyListeners();
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Get All Properties Service $err");
      return null;
    }
  }
}
