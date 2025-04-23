import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/domain/models/agent_model.dart';

import 'package:valorant_app/domain/repositories/i_agent_repository.dart';

class AgentViewmodel extends ChangeNotifier {
  final IAgentRepository _repository;
  late Command0 getAgentsCommand;

  final agents = <AgentModel>[];

  AgentViewmodel(this._repository) {
    getAgentsCommand = Command0(_getAgents);
  }

  AsyncResult<List<AgentModel>> _getAgents() {
    final agentsResult = _repository.getAgents();

    agentsResult.fold(
      (success) => agents.addAll(success),
      (error) {}, //
    );

    return agentsResult;
  }
}
