import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper_services/custom_loader.dart';
import '../services/area_size_view_service.dart';
import '../services/cities_service.dart';
import '../services/area_size_service.dart';
import '../services/property_typer_service.dart';


getAllAreaUnitHandler(BuildContext context, String catName)async{
  CustomLoader.showLoader(context: context);
  await  GetAllAreaUnitService().getAreaUnit(context: context, catName: catName);


  print("Asad");

  CustomLoader.hideLoader(context);
}
citiesHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await CitiesService().getAllCities(context: context);
  print("Ali");
  CustomLoader.hideLoader(context);
}
propertyTypeHandler(BuildContext context,String categoryType)async{
  CustomLoader.showLoader(context: context);
  await PropertyTypeService().getPropertyType(context: context,categoryType: "$categoryType");
  CustomLoader.hideLoader(context);
}
areaSizeViewHandler(BuildContext context,String catName,int areaSizeId,int typeId)async{
  CustomLoader.showLoader(context: context);
  await AreaSizeViewService().getAreaSizeView(context: context, catName: "$catName", areaSizeId: areaSizeId,typeId: typeId);
  print("Area Size Id $areaSizeId");
  print("Type Id $typeId");
  CustomLoader.hideLoader(context);
}



