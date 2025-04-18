import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';
import 'package:valorant_app/data/datasources/agent_datasource.dart';
import 'package:valorant_app/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:valorant_app/domain/models/agent_model.dart';
import 'package:valorant_app/domain/repositories/i_agent_repository.dart';
import 'package:valorant_app/shared/constants/constants.dart';

class AgentRepositoryImpl implements IAgentRepository {
  //
  final AgentDatasource _agentDatasource;
  final LocalStorageDatasource _localStorage;

  AgentRepositoryImpl(
    this._agentDatasource,
    this._localStorage, //
  );

  @override
  AsyncResult<List<AgentModel>> getAgents() async {
    //
    final selectedLanguage = await _localStorage //
        .read<String>(keyLanguageConstant);

    return _agentDatasource
        .getAgents(apiUrlConstant) //
        .flatMap(
          (agents) async {
            return await _agentDatasource.translateAgents(
              agents,
              toLanguage: selectedLanguage.getOrNull()!,
            );
          }, //
        );
  }

  @override
  AsyncResult<List<AgentModel>> searchByAgents(String name) {
    return getAgents() //
        .map(
          (agents) {
            return agents
                .where((agent) => agent.name == name) //
                .toList();
          }, //
        );
  }
}
