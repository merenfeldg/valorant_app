import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import 'package:valorant_app/domain/repositories/i_translation_repository.dart';

class SelectLanguageViewmodel extends ChangeNotifier {
  //
  final ITranslationRepository _repository;
  late Command1 setLanguage;

  SelectLanguageViewmodel(this._repository) {
    setLanguage = Command1<Unit, String>(_setLanguage);
  }

  AsyncResult<Unit> _setLanguage(String language) {
    return _repository.setLanguage(language);
  }
}
