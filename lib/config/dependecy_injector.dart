import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:valorant_app/data/datasources/agent_datasource.dart';
import 'package:valorant_app/data/datasources/http_client/http_client_datasource.dart';
import 'package:valorant_app/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:valorant_app/data/datasources/translation/translation_datasource.dart';
import 'package:valorant_app/data/repositories/agent_repository_impl.dart';
import 'package:valorant_app/data/repositories/translation_repository_impl.dart';
import 'package:valorant_app/domain/repositories/i_agent_repository.dart';
import 'package:valorant_app/domain/repositories/i_translation_repository.dart';
import 'package:valorant_app/shared/constants/constants.dart';
import 'package:valorant_app/ui/agents/viewmodel/agent_viewmodel.dart';
import 'package:valorant_app/ui/select_language/viewmodel/select_language_viewmodel.dart';
import 'package:valorant_app/ui/splash/viewmodel/splash_viewmodel.dart';

final dependecyInjector = AutoInjector();

void setupDependecies() {
  //DATASOURCES
  dependecyInjector.addSingleton(
    () => Dio(BaseOptions(baseUrl: apiUrlConstant)),
  );
  dependecyInjector.addSingleton(HttpClientDatasource.new);
  dependecyInjector.addSingleton(LocalStorageDatasource.new);
  dependecyInjector.addSingleton(TranslationDatasource.new);
  dependecyInjector.addSingleton(AgentDatasource.new);

  //REPOSITORIES
  dependecyInjector.addSingleton<IAgentRepository>(
    AgentRepositoryImpl.new, //
  );
  dependecyInjector.addSingleton<ITranslationRepository>(
    TranslationRepositoryImpl.new,
  );

  //VIEWMODELS
  dependecyInjector.addSingleton(SplashViewmodel.new);
  dependecyInjector.addSingleton(SelectLanguageViewmodel.new);
  dependecyInjector.addSingleton(AgentViewmodel.new);

  dependecyInjector.commit();
}
