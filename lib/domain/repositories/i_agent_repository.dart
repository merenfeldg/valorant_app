import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/domain/models/agent_model.dart';

abstract interface class IAgentRepository {
  AsyncResult<List<AgentModel>> getAgents();
  AsyncResult<List<AgentModel>> searchByAgent(String name);
}
