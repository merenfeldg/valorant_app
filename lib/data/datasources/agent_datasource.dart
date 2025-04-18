import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/data/datasources/http_client/http_client_datasource.dart';
import 'package:valorant_app/data/datasources/translation/translation_datasource.dart';
import 'package:valorant_app/domain/models/agent_model.dart';
import 'package:valorant_app/domain/value_objects/ability_value_object.dart';
import 'package:valorant_app/shared/enums/language_enum.dart';
import 'package:valorant_app/shared/exceptions/exceptions.dart';

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
        .map((apiResponse) {
          return (apiResponse.data['data'] as List)
              .map((json) => AgentModel.fromJson(json))
              .toList();
        });
  }

  AsyncResult<List<AgentModel>> translateAgents(
    List<AgentModel> agents, {
    required String toLanguage,
  }) async {
    try {
      final agentTranslations = await Future.wait(
        agents.map((agent) async {
          final translatedDescription = await _translator.translate(
            agent.description,
            from: LanguageEnum.english.acronym,
            to: toLanguage,
          );
          final translatedAbilities = await _translateAbilities(
            agent.abilities,
            LanguageEnum.english.acronym,
            toLanguage,
          );
          return agent.copyWith(
            description: translatedDescription,
            abilities: translatedAbilities,
          );
        }).toList(),
      );
      return Success(agentTranslations);
    } catch (e, s) {
      return Failure(
        ErrorUnkownTranslatorException(e.toString(), s.toString()),
      );
    }
  }

  Future<List<AbilityValueObject>> _translateAbilities(
    List<AbilityValueObject> abilities,
    String language,
    String newLanguage,
  ) async {
    final translatedAbilities = await Future.wait(
      abilities.map((ability) async {
        final translatedName = await _translator.translate(
          ability.name,
          from: language,
          to: newLanguage,
        );
        final translatedDescription = await _translator.translate(
          ability.descripton,
          from: language,
          to: newLanguage,
        );
        return ability.copyWith(
          name: translatedName,
          descripton: translatedDescription,
        );
      }),
    );
    return translatedAbilities;
  }
}
