import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import 'package:valorant_app/domain/repositories/i_agent_repository.dart';
import 'package:valorant_app/ui/agents/viewmodel/agent_states.dart';

class AgentViewmodel extends ValueNotifier<AgentStates> {
  //
  final IAgentRepository _repository;

  AgentViewmodel(this._repository) //
    : super(InitialState());

  void getAgents() {
    _repository.getAgents().fold(
      (success) => _emit(LoadedAgentsState(success)),
      (failure) => _emit(NotFoundAgentState()), //
    );
  }

  void searchAgentByName(String name) {
    _repository
        .searchByAgent(name)
        .fold(
          (succes) => _emit(LoadedAgentsState(succes)),
          (error) => _emit(NotFoundAgentState()),
        );
  }

  void _emit(AgentStates newState) {
    value = newState;
  }
}
