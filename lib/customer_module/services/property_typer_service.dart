
import 'dart:convert';

import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/property_type_model.dart';
import '../providers/property_type_provider.dart';

class PropertyTypeService{
  Future getPropertyType({required BuildContext context,required String categoryType})async{
    try{
      var res=await GetRequestService().httpGetRequest(context: context, url: getPropertyTypeUrl+"category=$categoryType");
      List<PropertyTypeModel> propertyType = (res).map<PropertyTypeModel>((m )=> PropertyTypeModel.fromJson(m)).toList();
      if(res!=null){
        Provider.of<PropertyTypeProvider>(context,listen: false).updatePropertyType(
          newPropertyType: propertyType
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get property type service $err");
      return null;
        }
  }
}