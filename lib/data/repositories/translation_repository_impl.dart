import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';
import 'package:valorant_app/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:valorant_app/data/datasources/translation/translation_datasource.dart';
import 'package:valorant_app/domain/repositories/i_translation_repository.dart';
import 'package:valorant_app/shared/constants/constants.dart';
import 'package:valorant_app/shared/exceptions/exceptions.dart';

class TranslationRepositoryImpl implements ITranslationRepository {
  //
  final LocalStorageDatasource _localStorage;
  final TranslationDatasource _translator;

  TranslationRepositoryImpl(
    this._localStorage,
    this._translator, //
  );

  @override
  AsyncResult<Unit> setLanguage(String newLanguage) async {
    await _localStorage.write(keyLanguageConstant, newLanguage);
    return Success(unit);
  }

  @override
  AsyncResult<String> getLanguage() async {
    return await _localStorage.read(keyLanguageConstant);
  }

  @override
  AsyncResult<String> translate(String text, String language) async {
    try {
      final selectedlanguage = await getLanguage().getOrNull();
      final translatedText = await _translator.translate(
        text,
        from: selectedlanguage!,
        to: language,
      );
      return Success(translatedText);
    } catch (e, s) {
      return Failure(
        ErrorUnkownTranslatorException(e.toString(), s.toString()),
      );
    }
  }
}
