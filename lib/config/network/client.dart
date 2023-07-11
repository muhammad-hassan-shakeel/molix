import 'package:http/http.dart' as http;

abstract class HttpClientWrapper {
  Future<http.Response> get(String path,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers});
  Future<http.Response> post(String path,
      {dynamic body, Map<String, String>? headers});
  Future<http.Response> put(String path,
      {dynamic body, Map<String, String>? headers});
}

class HttpClientWrapperV1 implements HttpClientWrapper {
  HttpClientWrapperV1();

  final http.Client _client = http.Client();

  @override
  Future<http.Response> get(String path,
          {Map<String, dynamic>? queryParameters,
          Map<String, String>? headers}) =>
      _client.get(Uri.parse(path), headers: headers);

  @override
  Future<http.Response> post(String path,
          {dynamic body, Map<String, String>? headers}) =>
      _client.post(Uri.parse(path), body: body, headers: headers);

  @override
  Future<http.Response> put(String path,
          {dynamic body, Map<String, String>? headers}) =>
      _client.put(Uri.parse(path), body: body, headers: headers);
}
