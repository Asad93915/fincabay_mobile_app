
import 'dart:convert';

import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/utils/internet_connectivity_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
class GetRequestService{
  Future httpGetRequest({required String url,required BuildContext context})async{
    print("get request url $url");
    try{
      if(await hasNetwork()){
        http.Response response=await http.get(Uri.parse(url));
        print("get request body ${response.body}");
        print("get request status code ${response.statusCode}");

        var jsonDecoded=json.decode(response.body);
        if(response.statusCode!=200){
          CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['message']);
          return false;
        }
        else{
          return jsonDecoded;
        }
      }
      else{
        return CustomSnackBar.failedSnackBar(context: context, message: "Internet Is not Connected");
      }
    }
        catch(err){

      print("exception in custom get request service ");
      return null;
        }
  }
}