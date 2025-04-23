import 'package:valorant_app/domain/models/agent_model.dart';

sealed class AgentStates {}

final class InitialState extends AgentStates {}

final class LoadedAgentsState extends AgentStates {
  final List<AgentModel> agents;

  LoadedAgentsState(this.agents);
}

final class NotFoundAgentState extends AgentStates {}
