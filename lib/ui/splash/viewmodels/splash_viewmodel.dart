import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import 'package:valorant_app/domain/repositories/i_translation_repository.dart';

class SplashViewmodel extends ChangeNotifier {
  //
  final ITranslationRepository _repository;
  late Command0 getLanguageCommand;

  SplashViewmodel(this._repository) {
    getLanguageCommand = Command0(_getLanguage);
  }

  AsyncResult<String> _getLanguage() async {
    return _repository.getLanguage();
  }
}
