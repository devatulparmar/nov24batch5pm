import 'package:http/http.dart' as http;

class ApiRepository {
  Future<http.Response> getAPICall(
      {required String url, Map<String, String>? headers}) async {
    return http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<http.Response> postAPICall({required String url, Object? body, Map<String, String>? headers}) async {
    return http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
  }
}
