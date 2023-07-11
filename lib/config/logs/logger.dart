import 'dart:developer';

abstract class Logger {
  void onRequest(String path, String method,
      {dynamic body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters});

  void onResponse(String path, String method,
      {required int statusCode, dynamic body});

  void onError(String path, String method,
      {int? statusCode, dynamic error, dynamic stackTrace});
}

class LoggerV1 implements Logger {
  const LoggerV1();

  @override
  void onError(String path, String method,
      {int? statusCode, error, stackTrace}) {
    log('ERROR START');
    log('$method $path');
    log('$statusCode');
    log('$error');
    _logIfNotNull('$stackTrace');
    log('ERROR END');
  }

  @override
  void onRequest(String path, String method,
      {body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) {
    log('REQUEST START');
    log('$method $path');
    _logIfNotNull('$headers');
    _logIfNotNull('$queryParameters');
    _logIfNotNull('$body');
    log('REQUEST END');
  }

  @override
  void onResponse(String path, String method, {required int statusCode, body}) {
    log('RESPONSE START');
    log('$method $path');
    log('$statusCode');
    _logIfNotNull('$body');
    log('RESPONSE END');
  }

  void _logIfNotNull(dynamic value) {
    if (value != null) {
      log('$value');
    }
  }
}
