import 'package:flutter/material.dart';

import '../helper_services/custom_loader.dart';
import '../services/cities_service.dart';
import '../services/get_all_area_unit_service.dart';
import '../services/property_typer_service.dart';


getAllAreaUnitHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await  GetAllAreaUnitService().getAreaUnit(context: context);

  print("Asad");
  CustomLoader.hideLoader(context);
}
citiesHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await CitiesService().getAllCities(context: context);
  print("Ali");
  CustomLoader.hideLoader(context);
}
propertyTypeHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await PropertyTypeService().getPropertyType(context: context);
  CustomLoader.hideLoader(context);
}