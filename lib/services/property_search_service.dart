import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:fincabay_application/models/property_search_model.dart';
import 'package:fincabay_application/providers/property_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PropertySearchService {
  Future getSearch({
    required BuildContext context,
    required cityId,
    required int areaId,
    required int phaseId,
  }) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: propSearchUrl +
              "cityid=$cityId&areaid=$areaId&locationphaseid=$phaseId",
          context: context);
      if (res!=null) {
        PropertySearchModel propertySearch = PropertySearchModel.fromJson(res);
        Provider.of<PropertySearchProvider>(context, listen: false)
            .updatePropertySearch(newSearch: propertySearch.data);
        return true;
      } else {
        return null;
      }
    } catch (err) {
      print("Exception in Property Search Service $err");
      return null;
    }
  }
}
