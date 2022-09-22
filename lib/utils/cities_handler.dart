import 'package:flutter/material.dart';

import '../helper_services/custom_loader.dart';
import '../services/cities_service.dart';

citiesHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await CitiesService().getAllCities(context: context);
  print("Ali");
  CustomLoader.hideLoader(context);
}