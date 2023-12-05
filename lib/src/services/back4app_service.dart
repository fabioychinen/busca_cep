import 'package:dio/dio.dart';

class Back4AppService {
  final Dio _dio = Dio();
  final String _appId = 'AVjYk1036vdzcGPgoM1OBt3mw36FwCOnzgdipwAQ';
  final String _clientKey = 'VMV5n321JZcKCCqzzpvny5W6SAN4pUOE2bATkYNK';
  final String _baseUrl = 'https://parseapi.back4app.com/classes/CEP';

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
