abstract class AppException implements Exception {
  final String message;
  final String? stackTrace;

  AppException(this.message, [this.stackTrace]);

  @override
  String toString() {
    if (stackTrace != null) {
      return '[$runtimeType]: $message\n[StackTrace]: $stackTrace';
    }
    return '$runtimeType: $message';
  }
}

//HTTP CLIENT
class NotFoundHttpClientException extends AppException {
  NotFoundHttpClientException(super.message);
}

class ErrorUnknownHttpClientException extends AppException {
  ErrorUnknownHttpClientException(super.message, [super.stackTrace]);
}
