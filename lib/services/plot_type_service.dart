
import 'dart:convert';

import 'package:fincabay_application/models/plot_type_model.dart';
import 'package:fincabay_application/providers/plot_type_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PlotTypeService{
  Future getPlot({required BuildContext context})async{
    try{
      Map<String,dynamic>response={
        "status": 1,
        "message": "success",
        "data":[
          {
            "areaType":"Residential Plot"
          },
          {
            "areaType":"Commercial Plot"
          },
          {
            "areaType":"Plot File"
          },
          {
            "areaType":"Plot Form"
          },
          {
            "areaType":"Agricultural Land"
          },
          {

            "areaType":"Industrial Land"
          },
        ]
      };
      PlotTypeModel plotTypeModel=PlotTypeModel.fromJson(response);
      Provider.of<PlotTypeProvider>(context,listen: false).updateType(
        newType: plotTypeModel.data
      );
      return true;
    }
        catch(err){
      print("Exception in Plot Typer Service $err");
      return null;
        }
  }
}