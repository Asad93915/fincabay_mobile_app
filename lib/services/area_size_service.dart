
import 'package:fincabay_application/providers/area_size_provider.dart';
import 'package:provider/provider.dart';

import 'package:fincabay_application/models/area_size_model.dart';
import 'package:flutter/cupertino.dart';

class AreaSizeService{
  Future getArea({required BuildContext context})async{
    final Map<String,dynamic> response= {
      "status": 1,
      "message": "success",
      "data":[
        {
        "totalArea":"3 Marla",
        "areaType":"Plot"
      },
        {
        "totalArea":"5 Marla",
        "areaType":"Plot"
      },
        {
        "totalArea":"7 Marla",
        "areaType":"Plot"
      },
        {
        "totalArea":"8 Marla",
        "areaType":"Plot"
      },
        {
        "totalArea":"10 Marla",
        "areaType":"Plot"
      },
        {
        "totalArea":"1 Kanal",
        "areaType":"Plots"
      },
      ]
    };


    AreaSizeModel areaSize=AreaSizeModel.fromJson(response);
    print(areaSize.data!.length);
    Provider.of<AreaSizeProvider>(context,listen: false).updateArea(
      newArea: areaSize.data
    );

    return true;
  }
}