import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/data/datasources/http_client/http_client_datasource.dart';
import 'package:valorant_app/data/datasources/translation/translation_datasource.dart';
import 'package:valorant_app/domain/models/agent_model.dart';

class AgentDatasource {
  //
  final HttpClientDatasource _httpClient;
  final TranslationDatasource _translator;

  AgentDatasource(
    this._httpClient,
    this._translator, //
  );

  AsyncResult<List<AgentModel>> getAgents(String url) async {
    return await _httpClient
        .get(url) //
        .flatMap((apiResponse) {
          final agents =
              (apiResponse.data['data'] as List)
                  .map((json) => AgentModel.fromJson(json))
                  .toList();
          return Success(agents);
        });
  }
}
