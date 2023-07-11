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
  HttpClientWrapperV1(this.baseUrl);

  final http.Client _client = http.Client();
  final String baseUrl;

  @override
  Future<http.Response> get(String path,
          {Map<String, dynamic>? queryParameters,
          Map<String, String>? headers}) =>
      _client.get(Uri.https(baseUrl, path, queryParameters), headers: headers);

  @override
  Future<http.Response> post(String path,
          {dynamic body, Map<String, String>? headers}) =>
      _client.post(Uri.https(baseUrl, path), body: body, headers: headers);

  @override
  Future<http.Response> put(String path,
          {dynamic body, Map<String, String>? headers}) =>
      _client.put(Uri.https(baseUrl, path), body: body, headers: headers);
}
