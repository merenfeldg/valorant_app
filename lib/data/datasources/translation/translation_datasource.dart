import 'package:translator/translator.dart';

class TranslationDatasource {
  Future<String> translate(String input, String from, String to) async {
    final translator = GoogleTranslator();

    final translation = await translator.translate(input, from: from, to: to);

    return translation.text;
  }
}
