
import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';

class AgentsAddPropertyService {
  Future addAgentProperty(
      {required BuildContext context,
      required String propTitle,
      required String content,
      required String propertyType,
      required String purpose,
      required String price,
      required String landArea,
      required String unit,
      required String noOfBeds,
      required String noOfBaths,
      required String expiryDate,
      required String city,
      required String area,
      required String detailsAddress}) async {
    try {
      Map _body = {
        "propertyTitle": propTitle,
        "content": content,
        "propertyType": propertyType,
        "purpose": purpose,
        "amount": price,
        "landArea": landArea,
        "unit": unit,
        "noOfBeds": noOfBeds,
        "noOfBaths": noOfBaths,
        "expireAfter": expiryDate,
        "city": city,
        "area": area,
        "detailAddress": detailsAddress
      };
      var res=await PostRequestService().httpPostRequest(url: agentAddPropUrl, body: _body, context: context);
      if(res!=null){
      print("property added successfully");

        return true;
      }
      else{
        return null;
      }
    } 
    catch (err) {
      print("Exception in add agents property service $err");
      return null;
    }
  }
}
