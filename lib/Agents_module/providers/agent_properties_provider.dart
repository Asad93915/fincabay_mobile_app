
import 'package:flutter/cupertino.dart';

import '../models/agent_properties_model.dart';

class AgentPropertiesProvider extends ChangeNotifier{
  List<AgentPropertiesModel>? getProperties=[];
  updateAgentProperties({List<AgentPropertiesModel>? newProperties}){
    print('lENgth ${getProperties!.length}');
    getProperties=newProperties;
    notifyListeners();
  }
}