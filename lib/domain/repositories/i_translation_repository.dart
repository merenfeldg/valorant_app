import 'package:result_dart/result_dart.dart';

abstract interface class ITranslationRepository {
  AsyncResult<String> getLanguage();
  AsyncResult<Unit> setLanguage(String newLanguage);
  AsyncResult<String> translate(String text, String toLanguage);
}
