import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper_services/custom_loader.dart';
import '../services/cities_service.dart';
import '../services/get_all_area_unit_service.dart';
import '../services/property_typer_service.dart';


getAllAreaUnitHandler(BuildContext context, int cityId)async{
  CustomLoader.showLoader(context: context);
  await  GetAllAreaUnitService().getAreaUnit(context: context, cityId:cityId );

  print("city id $cityId");
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


