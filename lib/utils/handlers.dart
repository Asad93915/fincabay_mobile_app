
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Agents_module/services/staff_member_service.dart';
import '../customer_module/services/area_size_service.dart';
import '../customer_module/services/area_size_view_service.dart';
import '../customer_module/services/cities_service.dart';
import '../customer_module/services/property_typer_service.dart';
import '../helper_services/custom_loader.dart';

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
areaSizeViewHandler(BuildContext context,String catName,int areaSizeId,int typeId)async {
  CustomLoader.showLoader(context: context);
  await AreaSizeViewService().getAreaSizeView(context: context,
      catName: "$catName",
      areaSizeId: areaSizeId,
      typeId: typeId);
  print("Area Size Id $areaSizeId");
  print("Type Id $typeId");
  CustomLoader.hideLoader(context);
}

  ////AGENTS hANDLERS
  getStaffMemberHandler(BuildContext context)async{
    CustomLoader.showLoader(context: context);
    await GetStaffMemberService().getStaff(context: context, agentId: Provider.of<UserDataProvider>(context,listen: false).user!.id!);
    CustomLoader.hideLoader(context);
  }




