
import 'package:flutter/cupertino.dart';

import '../models/get_all_agents_model.dart';

class AgentsListProvider extends ChangeNotifier{
  List<AgentsList>? agents=[];
  updateAgentsList({List<AgentsList>?newAgents}){
    print("Agents Length ${agents!.length}");
    agents=newAgents;
    notifyListeners();
  }
}