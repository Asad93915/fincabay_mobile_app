
import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/configs/api_configs.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/agent_properties_model.dart';

class ManageAgentPropertiesService{
  Future getAgentProp({required BuildContext context,required String userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: manageAgentPropUrl+"id=$userId", context: context);
      if(res!=null){
        List<AgentPropertiesModel> agentProperties = (res).map<AgentPropertiesModel>((m )=> AgentPropertiesModel.fromJson(m)).toList();
        // AgentPropertiesModel agentProperties=AgentPropertiesModel.fromJson(res);
        Provider.of<AgentPropertiesProvider>(context,listen: false).updateAgentProperties(
          newProperties: agentProperties
        );
        print("User Id $userId");
        return true;
      }
      else{
        return null;
      }

    }
        catch(err){
      print("Exception in Manage Agent Properties Service $err");
      return null;
        }
  }
}