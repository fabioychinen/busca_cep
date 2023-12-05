import 'package:dio/dio.dart';

class Back4AppService {
  final Dio _dio = Dio();


  Future<void> cadastrarCEP(Map<String, dynamic> cepData) async {
    try {
      await _dio.post(
        _baseUrl,
        data: cepData,
        options: Options(
          headers: {
            'X-Parse-Application-Id': _appId,
            'X-Parse-Client-Key': _clientKey,
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> consultarCEPs() async {
    try {
      final response = await _dio.get(
        _baseUrl,
        options: Options(
          headers: {
            'X-Parse-Application-Id': _appId,
            'X-Parse-Client-Key': _clientKey,
          },
        ),
      );
      return List<Map<String, dynamic>>.from(response.data['results']);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> getCeps() async {
    try {
      final response = await _dio.get(
        _baseUrl,
        options: Options(
          headers: {
            'X-Parse-Application-Id': _appId,
            'X-Parse-Client-Key': _clientKey,
          },
        ),
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
