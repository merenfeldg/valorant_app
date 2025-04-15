import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_app/shared/exceptions/exceptions.dart';

class LocalStorageDatasource {
  AsyncResult<T> read<T extends Object>(String key) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      final value = localStorage.get(key);
      return value != null
          ? Success(value as T)
          : Failure(
            KeyDontExistLocalStorageException(
              '[$runtimeType]: The key: $key don\'t exist, try other',
            ),
          );
    } catch (e, s) {
      return Failure(
        ErrorUnknownLocalStorageException(e.toString(), s.toString()),
      );
    }
  }

  AsyncResult<Unit> write(String key, Object data) async {
    try {
      final localStorage = await SharedPreferences.getInstance();

      switch (data.runtimeType.toString()) {
        case 'String':
          localStorage.setString(key, data as String);
          break;
        case 'int':
          localStorage.setInt(key, data as int);
          break;
        case 'double':
          localStorage.setDouble(key, data as double);
          break;
        case 'bool':
          localStorage.setBool(key, data as bool);
          break;
        case 'List<String>':
          localStorage.setStringList(key, data as List<String>);
          break;
        default:
          return Failure(
            DataTypeInvalidLocalStorageException(
              '[$runtimeType]: The type: ${data.runtimeType} can\'t be saved to Local Storage',
            ),
          );
      }
      return Success(unit);
    } catch (e, s) {
      return Failure(
        ErrorUnknownLocalStorageException(e.toString(), s.toString()),
      );
    }
  }
}
