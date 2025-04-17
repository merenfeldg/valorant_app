import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';
import 'package:valorant_app/data/datasources/agent_datasource.dart';
import 'package:valorant_app/domain/models/agent_model.dart';
import 'package:valorant_app/domain/repositories/i_agent_repository.dart';
import 'package:valorant_app/shared/constants/constants.dart';

class AgentRepositoryImpl implements IAgentRepository {
  //
  final AgentDatasource _agentDatasource;

  AgentRepositoryImpl(this._agentDatasource);

  @override
  AsyncResult<List<AgentModel>> getAgents() async {
    return _agentDatasource.getAgents(apiUrlConstant);
  }

  @override
  AsyncResult<List<AgentModel>> searchByAgents(String name) {
    return _agentDatasource
        .getAgents(apiUrlConstant) //
        .flatMap((listAgents) {
          final agents =
              listAgents
                  .where((agent) => agent.name == name) //
                  .toList();
          return Success(agents);
        });
  }
}
