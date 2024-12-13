import 'package:get/get.dart';
import 'package:emeron/core/services/http/http.service.dart';
import 'package:emeron/core/services/storage/storage.service.dart';
import 'package:emeron/core/services/exceptions/api.exceptions.dart';

class HttpServiceImpl extends GetxService implements IHttpService {
  final GetConnect _getConnect = GetConnect();

  @override
  Future<void> onInit() async {
    _getConnect.baseUrl = 'https://api-hmg.emeron.edu.br';
    _getConnect.timeout = const Duration(seconds: 30);

    _getConnect.httpClient.addRequestModifier<dynamic>((request) async {
      final token = await _getStorageToken();
      if (token != null) request.headers['Authorization'] = 'Bearer $token';

      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    _getConnect.httpClient.addResponseModifier((request, response) async {
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.bodyString}');

      if (response.statusCode == 401) {
        final newToken = await _refreshToken();
        if (newToken != null) {
          request.headers['Authorization'] = 'Bearer $newToken';
          return await _getConnect.request(
            request.url.toString(),
            request.method,
            body: request.bodyBytes,
            headers: request.headers,
          );
        }
      }
      return response;
    });

    super.onInit();
  }

  @override
  Future get(String url, {Map<String, String>? headers}) async {
    final response = await _getConnect.get(url, headers: headers);
    return _handleResponse(response);
  }

  @override
  Future post(String url, {dynamic body, Map<String, String>? headers}) async {
    final response = await _getConnect.post(url, body, headers: headers);
    return _handleResponse(response);
  }

  @override
  Future put(String url, {dynamic body, Map<String, String>? headers}) async {
    final response = await _getConnect.put(url, body, headers: headers);
    return _handleResponse(response);
  }

  @override
  Future delete(String url, {Map<String, String>? headers}) async {
    final response = await _getConnect.delete(url, headers: headers);
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      case 401:
        throw ApiUnauthorizedException();
      case 403:
        throw ApiForbiddenException();
      case 404:
        throw ApiNotFoundException();
      default:
        throw ApiException(
          message: response.bodyString ?? 'Erro desconhecido',
          statusCode: response.statusCode ?? 500,
        );
    }
  }

  Future<String?> _getStorageToken() async {
    final storage = Get.find<IStorageService>();
    return await storage.read('auth_token');
  }

  Future<String?> _refreshToken() async {
    try {
      final response = await _getConnect.post(
        '/auth/refresh',
        {'refresh_token': await _getStorageToken()},
      );

      if (response.statusCode == 200) {
        final newToken = response.body['token'];
        // Salvar novo token
        final storage = Get.find<IStorageService>();
        await storage.write('auth_token', newToken);
        return newToken;
      }
      return null;
    } catch (e) {
      print('Erro ao fazer refresh do token: $e');
      return null;
    }
  }
}
