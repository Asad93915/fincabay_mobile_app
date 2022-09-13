
import 'package:fincabay_application/models/commercial_area_type_model.dart';
import 'package:fincabay_application/providers/commercial_area_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CommercialAreaTypeService{
  Future getAreaType({required BuildContext context})async{
    try{
      Map<String,dynamic>response={
        "status": 1,
        "message": "success",
        "data":[
          {
            "commercialAreaType":"Office"
          },
          {
            "commercialAreaType":"Shop"
          },
          {
            "commercialAreaType":"Building"
          },
          {
            "commercialAreaType":"WearHouse"
          },
          {
            "commercialAreaType":"Factory"
          },
          {

            "commercialAreaType":"Other"
          }
        ]
      };
      print("SNANMBDSB ");
      CommercialAreaTypeModel  areaTypeModel=CommercialAreaTypeModel.fromJson(response);
      Provider.of<CommercialAreaTypeProvider>(context,listen: false).updateCommercialArea(
          newCommercialType: areaTypeModel.data
      );
      return true;
    }
    catch(err){
      print("Exception in Commercial Typer Service $err");
      return null;
    }
  }
}