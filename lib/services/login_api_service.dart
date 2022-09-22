

import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:fincabay_application/models/user_response_model.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginApiService{
  Future getLogin({required BuildContext context,required String userName,required String password })async{
    try{
      String loginUrl="http://172.106.228.154/DMSTest/API/Login2";
      Map _body={"UserName":userName,"Password":password};
      var res=await PostRequestService().httpPostRequest(url: loginUrl, body: _body, context: context);
      if(res !=null){
        UserResponseModel userResponseModel=UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context,listen: false).updateUserData(
          newUser: userResponseModel.data
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in login api serice $err");
      return null;
        }
  }
}