import 'dart:convert';

import 'package:http/http.dart';
import 'package:molix/config/logs/logger.dart';
import 'package:molix/config/network/client.dart';

import '../exception_handler/exceptions.dart';

typedef MapOrList = Either<Map<String, dynamic>, List>;

class NetworkFacade {
  NetworkFacade({required this.client, this.logger = const LoggerV1()});

  final Logger logger;
  final HttpClientWrapper client;

  Future<MapOrList> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      logger.onRequest(path, 'GET',
          headers: headers, queryParameters: queryParameters);
      final response = await client.get(path,
          headers: headers, queryParameters: queryParameters);
      logger.onResponse(path, 'GET',
          statusCode: response.statusCode, body: response.body);
      final parsedResponse = _handleJson(response);
      return parsedResponse;
    } catch (e) {
      logger.onError(path, 'GET', error: e);
      rethrow;
    }
  }

  MapOrList _handleJson(Response response) {
    if (response.body.isEmpty) {
      return Either.left({});
    }

    final json = jsonDecode(response.body);
    if (json is Map<String, dynamic>) {
      return Either.left(json);
    } else if (json is List) {
      return Either.right(json);
    } else {
      throw const JsonParsingException('Invalid json');
    }
  }
}

class Either<T, E> {
  Either._(this._value);

  factory Either.left(T value) => Either._(value);
  factory Either.right(E value) => Either._(value);

  final dynamic _value;

  bool get isLeft => _value is T;
  bool get isRight => _value is E;

  T get left => _value as T;
  E get right => _value as E;
}
