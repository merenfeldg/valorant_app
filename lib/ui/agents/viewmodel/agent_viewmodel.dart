import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/domain/models/agent_model.dart';

import 'package:valorant_app/domain/repositories/i_agent_repository.dart';

class AgentViewmodel extends ChangeNotifier {
  //
  final IAgentRepository _repository;

  late Command0 getAgentsCommand;
  late Command1 searchByAgentsCommand;

  AgentViewmodel(this._repository) {
    getAgentsCommand = Command0(_getAgents);
    searchByAgentsCommand = Command1<List<AgentModel>, String>(_searchByAgent);
  }

  AsyncResult<List<AgentModel>> _getAgents() {
    return _repository.getAgents();
  }

  AsyncResult<List<AgentModel>> _searchByAgent(String name) {
    return _repository.searchByAgent(name);
  }
}
