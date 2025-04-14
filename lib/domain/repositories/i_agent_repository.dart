import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/domain/models/agent_model.dart';

abstract interface class IAgentRepository {
  AsyncResult<AgentModel> getAgents();
  AsyncResult<List<AgentModel>> searchByAgents(String name);
}
