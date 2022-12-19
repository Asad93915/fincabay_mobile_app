
import 'package:fincabay_application/Customer_module/models/get_all_agents_model.dart';
import 'package:fincabay_application/Customer_module/providers/agents_list_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';

class GetAllAgentsService{
  Future getAgents({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getAllAgentsUrl, context: context);

      if(res!=null){
        print("Inside");

     AgentsListModel agentsList=AgentsListModel.fromJson(res);
    Provider.of<AgentsListProvider>(context,listen: false).updateAgentsList(
          newAgents: agentsList.data
        );
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get Agents Service $err");
      return null;
        }
  }
}