
import 'package:fincabay_application/Agents_module/models/get_all_staff_member_model.dart';
import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/agent_properties_model.dart';

class ManageAgentPropertiesService{
  Future getAgentProp({required BuildContext context,required String agentEmail})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: manageAgentPropUrl+"Email=$agentEmail", context: context);

      if(res!=null){

       AgentPropertiesModel agentProperties=AgentPropertiesModel.fromJson(res);

        Provider.of<AgentPropertiesProvider>(context,listen: false).updateAgentProperties(
          newProperties: agentProperties.data
        );
        print("User Id $agentEmail");
        return true;
      }
      else{
        print("OutSide");
        return null;
      }

    }
        catch(err){
      print("Exception in Manage Agent Properties Service $err");
      return null;
        }
  }
}