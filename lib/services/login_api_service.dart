

import 'package:fincabay_application/helper_services/custom_post_reques_service.dart';
import 'package:fincabay_application/models/user_response_model.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../configs/api_configs.dart';

class LoginApiService{
  Future getLogin({required BuildContext context,required String email,required String password })async{
    try{

      Map _body={"email":email,"password":password};
      var res=await PostRequestService().httpPostRequest(url: loginUrl, body: _body, context: context);
      if(res !=null){
        UserResponseModel userResponseModel=UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context,listen: false).updateUserData(
          newUser: userResponseModel.data
        );

        final box=GetStorage();
        box.write('user', userResponseModel.data!.toJson());



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