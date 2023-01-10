
import 'package:fincabay_application/Customer_module/models/get_all_agents_model.dart';
import 'package:fincabay_application/Customer_module/providers/agents_list_provider.dart';
import 'package:fincabay_application/helper_services/custom_get_request_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_configs.dart';

class GetAllAgentsService extends ChangeNotifier{
  List<AgentsList>? agentsList=[];
  int pageNumber=1;

  Future getInitAgents({required BuildContext context})async{
    await getMoreAgents(context: context);
  }
  Future getMoreAgents({required BuildContext context})async{


    try{
      var res=await GetRequestService().httpGetRequest(url: getAllAgentsUrl+"pageNo=$pageNumber", context: context);

      if(res!=null){
        print("Inside");

        AgentsListModel agentsModel=AgentsListModel.fromJson(res);
   if(pageNumber==1 || agentsList==[]){
     print("If");

     agentsList=agentsModel.data;
     print("Length ${agentsList!.length}");
   }
   else{
     print("else");
     agentsList!.addAll(agentsModel.data!);
   }
   notifyListeners();
   return true;
    // Provider.of<AgentsListProvider>(context,listen: false).updateAgentsList(
    //       newAgents: agentsList.data
    //     );
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