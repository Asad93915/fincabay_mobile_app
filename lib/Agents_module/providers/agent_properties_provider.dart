
import 'package:flutter/cupertino.dart';

import '../models/agent_properties_model.dart';

class AgentPropertiesProvider extends ChangeNotifier{
  List<AgentProperties>? getProperties=[];
  updateAgentProperties({List<AgentProperties>? newProperties}){
    print('lENgth ${getProperties!.length}');
    getProperties=newProperties;
    notifyListeners();
  }
}