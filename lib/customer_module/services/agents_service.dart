
import 'package:fincabay_application/customer_module/models/get_all_agents_model.dart';
import 'package:fincabay_application/customer_module/providers/agents_list_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';

class GetAllAgentsService{
  Future getAgents({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getAllAgentsUrl, context: context);
      if(res!=null){
        // AgentsListModel agentsListModel=AgentsListModel.fromJson(res);

        List<AgentsListModel>agentsListModel=(res).map<AgentsListModel>((m)=>AgentsListModel.fromJson(m)).toList();
        Provider.of<AgentsListProvider>(context,listen: false).updateAgentsList(
          newAgents: agentsListModel
        );
      }
    }
        catch(err){}
  }
}