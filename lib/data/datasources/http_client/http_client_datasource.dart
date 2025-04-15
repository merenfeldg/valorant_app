import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:valorant_app/shared/exceptions/exceptions.dart';

class HttpClientDatasource {
  final Dio _httpClient;

  HttpClientDatasource(this._httpClient);

  AsyncResult<Response> get(String url) async {
    try {
      final response = await _httpClient.get(url);
      if (response.statusCode == 200) {
        return Success(response);
      } else {
        return Failure(
          NotFoundHttpClientException(
            '[$runtimeType]: Server Not Found the requested resource',
          ),
        );
      }
    } on DioException catch (e, s) {
      return Failure(
        ErrorUnknownHttpClientException(e.toString(), s.toString()),
      );
    }
  }
}
