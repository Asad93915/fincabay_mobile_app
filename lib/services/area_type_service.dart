
import 'package:fincabay_application/models/area_type_model.dart';
import 'package:fincabay_application/providers/area_type_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AreaTypeService{
  Future getAreaType({required BuildContext context})async{
    try{

      Map<String,dynamic>response={
        "status": 1,
        "message": "success",
        "data":[
          {
            "areaType":"Houses"
          },
          {
            "areaType":"Flats"
          },
          {
            "areaType":"Upper\nPortion"
          },
          {
            "areaType":"Lower\nPortion"
          },
          {
            "areaType":"Farmhouse"
          },
          {

            "areaType":"Penthouse"
          },
        ]
      };
      AreaTypeModel areaType=AreaTypeModel.fromJson(response);
      Provider.of<AreaTypeProvider>(context,listen: false).updateAreaType(
        newType: areaType.data
      );
      return true;
    }
        catch(err){
      print("Exception in Area Typer Service $err");
      return null;
        }
  }
}